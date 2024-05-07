import ballerinax/kafka;
import ballerina/io;
import ballerina/http;
import ballerina/mime;

listener kafka:Listener orderListener = new (kafka:DEFAULT_URL, {
    groupId: "result-file-group-id",
    topics: "result-test-topic"
});

service on orderListener {
    remote function onConsumerRecord(xml[] results) returns error? {
        foreach xml result in results {
            io:println("Result Received from Kafka for File ", result.toString());

            http:Client fileSaveAPIClient = check new ("localhost:8294");
            xml fileResult = check fileSaveAPIClient->/save_result.post(result, {
                Accept: mime:APPLICATION_SOAP_XML
            });

            io:println("Email response from file save ", fileResult);
        }
    }
}
