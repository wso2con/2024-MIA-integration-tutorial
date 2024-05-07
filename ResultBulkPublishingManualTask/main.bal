import ballerina/io;
import ballerina/http;

public function main() returns error? {
    string resultFilePath = "../resources/result.csv";

    stream<string[], io:Error?> csvStream = check io:fileReadCsvAsStream(resultFilePath);
    http:Client resultPublishClient = check new ("localhost:8292");

    _ = check csvStream.forEach(function(string[] val) {
        io:println(val);

        xml payload = xml `<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:res="http://moe.com/xsd/Result/">
        <soapenv:Header/>
        <soapenv:Body>
            <res:ResultPublishMessage>
                <student_id>${val[0]}</student_id>
                <subject>${val[1]}</subject>
                <marks>${val[2]}</marks>
                <semester>${val[3]}</semester>
            </res:ResultPublishMessage>
        </soapenv:Body>
        </soapenv:Envelope>`;

        io:println(payload);

        string|http:ClientError result = resultPublishClient->/resultPublish/publish.post(payload);

        io:println(result);
    });

}
