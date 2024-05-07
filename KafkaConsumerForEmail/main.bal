import ballerinax/kafka;
import ballerina/io;
import ballerina/http;
import ballerina/mime;

listener kafka:Listener orderListener = new (kafka:DEFAULT_URL, {
    groupId: "result-email-group-id",
    topics: "result-test-topic"
});

service on orderListener {
    remote function onConsumerRecord(xml[] results) returns error? {
        foreach xml result in results {
            io:println("Result Received from Kafka for email and file ", result.toString());

            http:Client sendEmailAPIClient = check new ("localhost:8293");
            xml emailResult = check sendEmailAPIClient->/result_email.post(result, {
                Accept: mime:APPLICATION_SOAP_XML
            });

            io:println("Email response from email ", emailResult.toString());
        }
    }
}
