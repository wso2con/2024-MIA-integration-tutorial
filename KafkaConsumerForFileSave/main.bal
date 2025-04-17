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

            // https://859bb7a3-f072-4481-b3ad-a000726242b2-prod.e1-us-east-azure.choreoapis.dev/ialn/ftpfilesave/v1
            // http:Client fileSaveAPIClient = check new ("https://859bb7a3-f072-4481-b3ad-a000726242b2-prod.e1-us-east-azure.choreoapis.dev");
            // xml fileResult = check fileSaveAPIClient->/ialn/ftpfilesave/v1.post(result, {
            //     "Accept": mime:APPLICATION_SOAP_XML,
            //     "Content-Type": "application/xml",
            //     "Authorization": "Bearer eyJ4NXQiOiJtelh1RUZvZEw2YXluanhmN0t4MXpwWTlBS1EiLCJraWQiOiJZemN4T0dVNE1qQTNNMkU1TkRZM1ptRTFNRGcyWlRabFlUZGpOak0xTTJVek5XSmtZakpqTjJWbFlXSmlPV0kxTXpkbE1EQTBNMk0zTkRrM09USTNaUV9SUzI1NiIsInR5cCI6ImF0K2p3dCIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJmNDA0YjlhYy0xMzgxLTRmODItODBlMy01YzVjOWU4MjE2M2MiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6WyJBaDNZVlZ5a2tLUlduVmhMYUpqR2k1OW9HdjBhIiwiY2hvcmVvOmRlcGxveW1lbnQ6cHJvZHVjdGlvbiJdLCJuYmYiOjE3MTc2NTE1MzAsImF6cCI6IkFoM1lWVnlra0tSV25WaExhSmpHaTU5b0d2MGEiLCJvcmdfaWQiOiI4NTliYjdhMy1mMDcyLTQ0ODEtYjNhZC1hMDAwNzI2MjQyYjIiLCJpc3MiOiJodHRwczpcL1wvYXBpLmFzZ2FyZGVvLmlvXC90XC9zaGF6bmljaG9yZW9cL29hdXRoMlwvdG9rZW4iLCJleHAiOjE3MTc2NTI0MzAsIm9yZ19uYW1lIjoic2hhem5pY2hvcmVvIiwiaWF0IjoxNzE3NjUxNTMwLCJqdGkiOiJlOGQzZGI4MS1iODhkLTQ3ZmQtODczYy1lYWJmODc0MWIyNDIiLCJjbGllbnRfaWQiOiJBaDNZVlZ5a2tLUlduVmhMYUpqR2k1OW9HdjBhIn0.TkMVvGPKSCb7gfkOprj6WmOK5UQUpKfC7dP3SxCt0Btqn_pbrb3_65Fnuv0yA7rgMWVEe2OAKN0Rl-_nN8O8AxdnTmSvMYjhqXrCb4pTPArzwTA-7UNVGpt3VfQ9iVgGBznXWypkHQKzjedeFS5wy-jQhIzhyHUVFePwTg9JhrYDMBfcJ5UVNdkR6I8fxV8lZFpVVa0DZjptUXbzKLNIspg79Z0tlXWXImQQR38wrlSb6avnVL_R28v_Wmi8XVNZtKwPbqJI_2gfEX8oiKGSDN0S77vXeB8B3SOlIYAWc85drPLziMyEzgpMwNNPzmEe_NkeNIXjQsNUXQIMov9iwg"
            // });

            io:println("Email response from file save ", fileResult);
        }
    }
}
