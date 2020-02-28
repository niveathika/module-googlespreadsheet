import ballerina/io;
import ballerina/system;
import ballerina/test;
// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

//import ballerina/test;
//

@test:Config {}
function testEnvVariables() {
    string clientId = system:getEnv("CLIENT_ID");
    if (clientId == "999332401198-m4lqtiu4io7h592of98qmfue8jeqtfan.apps.googleusercontent.com") {
        io:println("Yasssssss");
    }
    io:println(io:sprintf("Client id: %s123", clientId));
}

// Tests the Client actions
@test:Config {}
function testCreateSpreadsheet() {
    string createSpreadsheetName = "Ballerina Connector New";
    string clientId = system:getEnv("CLIENT_ID");
    string accessToken = system:getEnv("ACCESS_TOKEN");
    string clientSecret = system:getEnv("CLIENT_SECRET");
    string refreshToken = system:getEnv("REFRESH_TOKEN");
    if (clientId == "999332401198-m4lqtiu4io7h592of98qmfue8jeqtfan.apps.googleusercontent.com") {
        io:println("Client id is correct");
    }
    if (accessToken == "ya29.Il-_B0Ure4T_jL7GUYykByfS6TSDV2umiWbwf0pLD8lYjRxX3QU2hRwNin3yluOJMgdsuT2lZzUgoFpDi82mhfjPDsz9Pz_B8t_vtwzej8hsxGEG-e-bwDnfemLDSN2viQ")
    {
        io:println("Access token is correct");
    }
    if (clientSecret == "BYYXpvBV5IP0cwXwGAz-yHkC") {
        io:println("Client secret is correct");
    }
    if (refreshToken == "1//04OnzYR5qkaK4CgYIARAAGAQSNwF-L9Ir5-rY8fg27kEsRIVvCsIvroPE02mF95A6CDU-LEdGLF4xoEdHOc-tq0DZnjfmkVtLhEo")
    {
        io:println("Refresh token is correct");
    }
    SpreadsheetConfiguration config = {
        oAuthClientConfig: {
            accessToken: accessToken,
            refreshConfig: {
                clientId: clientId,
                clientSecret: clientSecret,
                refreshUrl: REFRESH_URL,
                refreshToken: refreshToken
            }
        }
    };
    Client spreadsheetClient = new (config);
    //var spreadsheetRes = spreadsheetClient->createSpreadsheet(createSpreadsheetName);
    //if (spreadsheetRes is Spreadsheet) {
    //    Spreadsheet testSpreadsheet = <@untainted>spreadsheetRes;
    //    test:assertNotEquals(spreadsheetRes.spreadsheetId, "", msg = "Failed to create spreadsheet");
    //    string spreadsheetId = testSpreadsheet.spreadsheetId;
    //} else {
    //    test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
    //}
}

//SpreadsheetConfiguration config = {
//    oAuthClientConfig: {
//        accessToken: system:getEnv("ACCESS_TOKEN"),
//        refreshConfig: {
//            clientId: "999332401198-m4lqtiu4io7h592of98qmfue8jeqtfan.apps.googleusercontent.com",
//            clientSecret: "BYYXpvBV5IP0cwXwGAz-yHkC",
//            refreshUrl: REFRESH_URL,
//            refreshToken: "1//04OnzYR5qkaK4CgYIARAAGAQSNwF-L9Ir5-rY8fg27kEsRIVvCsIvroPE02mF95A6CDU-LEdGLF4xoEdHOc-tq0DZnjfmkVtLhEo "
//        }
//    }
//};
//
//Client spreadsheetClient = new (config);
//
//string copyToSpreadsheet = "Copy To";
//string spreadsheetId = "";
//string testSpreadsheetName = "Ballerina Connector";
//string createSpreadsheetName = "Ballerina Connector New";
//string testSheetName = "Dance";
//string testDeleteSheetName = "Remove Dance";
//int testSheetId = 0;
//string[][] entries = [
//    ["Name", "Score", "Performance", "Average"],
//    ["Keetz", "12"],
//    ["Niro", "78"],
//    ["Nisha", "98"],
//    ["Kana", "86"]
//];

//// Tests the Client actions
//@test:Config {}
//function testCreateSpreadsheet() {
//    var spreadsheetRes = spreadsheetClient->createSpreadsheet(createSpreadsheetName);
//    if (spreadsheetRes is Spreadsheet) {
//        Spreadsheet testSpreadsheet = <@untainted>spreadsheetRes;
//        test:assertNotEquals(spreadsheetRes.spreadsheetId, "", msg = "Failed to create spreadsheet");
//        spreadsheetId = testSpreadsheet.spreadsheetId;
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}

//@test:Config {
//    dependsOn: ["testCreateSpreadsheet"]
//}
//function testOpenSpreadsheetById() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        test:assertEquals(spreadsheetRes.spreadsheetId, spreadsheetId, msg = "Failed to open the spreadsheet");
//        Spreadsheet testSpreadsheet = <@untainted>spreadsheetRes;
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
////Tests the Spreadsheet client actions
//@test:Config {
//    dependsOn: ["testCreateSpreadsheet"]
//}
//function testGetProperties() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        SpreadsheetProperties props = spreadsheetRes.getProperties();
//        test:assertEquals(props.title, createSpreadsheetName, msg = "Failed to get properties of the spreadsheet");
//        Spreadsheet testSpreadsheet = <@untainted>spreadsheetRes;
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testCreateSpreadsheet"]
//}
//function testAddSheet() {
//    var response = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (response is Spreadsheet) {
//        Sheet | error addSheetRes = response->addSheet(testSheetName);
//        if (addSheetRes is Sheet) {
//            testSheetId = <@untainted>addSheetRes.properties.sheetId;
//            test:assertNotEquals(addSheetRes.properties.sheetId, "", msg = "Failed to add a sheet");
//        } else {
//            test:assertFail(msg = <string>addSheetRes.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>response.detail()["message"]);
//
//    }
//}
//
//@test:Config {
//    dependsOn: ["testCreateSpreadsheet", "testAddSheet"]
//}
//function testGetSheets() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            test:assertNotEquals(sheets.length(), 0, msg = "Failed to get the sheets");
//            test:assertEquals(sheets[0].parentId, spreadsheetId);
//        } else {
//            test:assertFail(msg = <string>sheets.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testCreateSpreadsheet", "testAddSheet"]
//}
//function testGetSheetByName() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet | error sheet = spreadsheetRes.getSheetByName(testSheetName);
//        if (sheet is Sheet) {
//            test:assertEquals(sheet.properties.title, testSheetName, msg = "Failed to get the sheet by name");
//        } else {
//            test:assertFail(msg = <string>sheet.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testCreateSpreadsheet"]
//}
//function testRemoveSheet() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet | error addSheetRes = spreadsheetRes->addSheet(testDeleteSheetName);
//        if (addSheetRes is Sheet) {
//            testSheetId = <@untainted>addSheetRes.properties.sheetId;
//            test:assertNotEquals(addSheetRes.properties.sheetId, "", msg = "Failed to remove the sheet");
//            error? removeRes = spreadsheetRes->removeSheet(<@untainted>addSheetRes.id);
//            test:assertEquals(removeRes, (), msg = "Fsilrf");
//        } else {
//            test:assertFail(msg = <string>addSheetRes.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testCreateSpreadsheet"]
//}
//function testRename() {
//    string newName = createSpreadsheetName + " Renamed";
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        test:assertEquals(spreadsheetRes.getProperties().title, createSpreadsheetName, msg = "Failed to " +
//        "rename the spreadsheet");
//        error? res = spreadsheetRes->rename(newName);
//        if (res is ()) {
//            createSpreadsheetName = newName;
//            test:assertEquals(spreadsheetRes.getProperties().title, newName, msg = "Failed");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
////// Tests the Sheet client actions
//@test:Config {
//    dependsOn: ["testAddSheet"]
//}
//function testSheetRename() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    string newName = "Renamed";
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var res = sheet->rename(newName);
//            if (res is ()) {
//                test:assertEquals(sheet.getProperties().title, newName, msg = "Failed to rename the sheet");
//            } else {
//                test:assertFail(msg = <string>res.detail()["message"]);
//            }
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddSheet", "testSetRange"]
//}
//function testSetCell() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->setCell("A10", "ModifiedValue");
//            test:assertEquals(setRes, (), msg = "Failed to set the cell value");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddSheet", "testSetCell"]
//}
//function testGetCell() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->getCell("A10");
//            test:assertEquals(setRes, "ModifiedValue", msg = "Failed to get the cell value");
//        } else {
//            test:assertFail(msg = <string>sheets.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddSheet", "testSetRange"]
//}
//function testGetRow() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var res = sheet->getRow(2);
//            test:assertEquals(res.toString(), "Keetz 12", msg = "Failed to get the row values");
//        } else {
//            test:assertFail(msg = <string>sheets.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddSheet", "testSetRange"]
//}
//function testGetColumn() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var res = sheet->getColumn("B");
//            test:assertEquals(res.toString(), "Score 12 78 98 86", msg = "Failed to get the column values");
//        } else {
//            test:assertFail(msg = <string>sheets.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddSheet"]
//}
//function testSetRange() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            Range range = {a1Notation: "A1:D5", values: entries};
//            var setRes = sheet->setRange(<@untainted>range);
//            test:assertEquals(setRes, (), msg = "Failed to set the values of the range");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddSheet", "testSetRange"]
//}
//function testGetRange() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->getRange("A1:D5");
//            if (setRes is Range) {
//                test:assertEquals(setRes.values, entries, msg = "Failed to get the values of the range");
//            }
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testSetRange", "testGetRange", "testGetColumn", "testGetCell", "testGetRow"]
//}
//function testAddRowsBefore() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->addRowsBefore(1, 2);
//            test:assertEquals(setRes, (), msg = "Failed to add rows before the given index");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddRowsBefore"]
//}
//function testAddRowsAfter() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->addRowsAfter(4, 2);
//            test:assertEquals(setRes, (), msg = "Failed to add rows after the given index");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddRowsBefore"]
//}
//function testAddColumnsBefore() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->addColumnsBefore(1, 2);
//            test:assertEquals(setRes, (), msg = "Failed to add columns before the given index");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddColumnsBefore"]
//}
//function testAddColumnsAfter() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->addColumnsAfter(3, 2);
//            test:assertEquals(setRes, (), msg = "Failed to add columns after the given index");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddColumnsAfter"]
//}
//function testDeleteColumns() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var res = sheet->deleteColumns(1, 2);
//            test:assertEquals(res, (), msg = "Failed to delete columns");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testAddRowsAfter"]
//}
//function testDeleteRows() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var res = sheet->deleteRows(5, 2);
//            test:assertEquals(res, (), msg = "Failed to delete rows");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testDeleteRows"]
//}
//function testCopyTo() {
//    var copyToSpreadsheet = spreadsheetClient->createSpreadsheet(copyToSpreadsheet);
//    if (copyToSpreadsheet is Spreadsheet) {
//        var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//        if (spreadsheetRes is Spreadsheet) {
//            Sheet[] | error sheets = spreadsheetRes.getSheets();
//            if (sheets is Sheet[]) {
//                Sheet sheet = sheets[0];
//                var res = sheet->copyTo(<@untainted>copyToSpreadsheet);
//                test:assertEquals(res, (), msg = "Failed to copy the spreadsheet");
//            }
//        } else {
//            test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//        }
//    } else {
//        test:assertFail(msg = <string>copyToSpreadsheet.detail()["message"]);
//    }
//}
//
//@test:Config {
//    dependsOn: ["testGetCell"]
//}
//function testClearCell() {
//    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
//    if (spreadsheetRes is Spreadsheet) {
//        Sheet[] | error sheets = spreadsheetRes.getSheets();
//        if (sheets is Sheet[]) {
//            Sheet sheet = sheets[0];
//            var setRes = sheet->clearCell("A10");
//            test:assertEquals(setRes, (), msg = "Failed to clear the cell");
//        }
//    } else {
//        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
//    }
//}
//
////@test:Config {
////    dependsOn: ["testAddSheet", "testSetRange"]
////}
////function testClearRange() {
////    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
////    if (spreadsheetRes is Spreadsheet) {
////        Sheet[] | error sheets = spreadsheetRes.getSheets();
////        if (sheets is Sheet[]) {
////            Sheet sheet = sheets[0];
////            var setRes = sheet->getRange("A1:C5");
////            if (setRes is Range) {
////                test:assertEquals(setRes.values, entries, msg = "Fail");
////            }
////        }
////    } else {
////        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
////    }
////}
////
////@test:Config {
////    dependsOn: ["testAddSheet", "testSetRange"]
////}
////function testClearAll() {
////    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
////    if (spreadsheetRes is Spreadsheet) {
////        Sheet[] | error sheets = spreadsheetRes.getSheets();
////        if (sheets is Sheet[]) {
////            Sheet sheet = sheets[0];
////            var setRes = sheet->getRange("A1:C5");
////            if (setRes is Range) {
////                test:assertEquals(setRes.values, entries, msg = "Fail");
////            }
////        }
////    } else {
////        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
////    }
////}
////
////@test:Config {
////    dependsOn: ["testAddSheet", "testSetRange"]
////}
////function testAppendRow() {
////    var spreadsheetRes = spreadsheetClient->openSpreadsheetById(spreadsheetId);
////    if (spreadsheetRes is Spreadsheet) {
////        Sheet[] | error sheets = spreadsheetRes.getSheets();
////        if (sheets is Sheet[]) {
////            Sheet sheet = sheets[0];
////            var setRes = sheet->getRange("A1:C5");
////            if (setRes is Range) {
////                test:assertEquals(setRes.values, entries, msg = "Fail");
////            }
////        }
////    } else {
////        test:assertFail(msg = <string>spreadsheetRes.detail()["message"]);
////    }
////}
