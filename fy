function doGet(){
  var spreadsheet = SpreadsheetApp.openById('1YSoCrqxEAIcr6dKAB83q-BPOtvcKz7zvs4wYtE58Npw'); // Sheet id
  var sheet = spreadsheet.getSheets()[0];
  var rowLength = sheet.getLastRow();
  var columnLength = sheet.getLastColumn();
  var data = sheet.getRange(3,1,rowLength,columnLength).getValues();
  var dataExport = ['<li class="table-header"><div class="col col-1">委託人姓名</div><div class="col col-2"++>委託項目</div><div class="col col-3">付款狀態</div><div class="col col-4">進度狀態</div></li>'];
  var stat, ed=[];
  // 一個個加入json
  for(i in data){
    if(data[i][0] != ""){
      if (data[i][3]=="完成"){
    ed.push('<li class="table-row"><div class="col col-1" data-label="委託人姓名">'+data[i][0]
+'</div><div class="col col-2" data-label="委託項目">'+data[i][1]
+'</div><div class="col col-3" data-label="付款狀態">'+data[i][2]+" "+data[i][4]
+'</div><div class="col col-4 finished" data-label="進度狀態">'+data[i][3]+'</div></li>')
      }else{
    dataExport.push('<li class="table-row"><div class="col col-1" data-label="委託人姓名">'+data[i][0]
+'</div><div class="col col-2" data-label="委託項目">'+data[i][1]
+'</div><div class="col col-3" data-label="付款狀態">'+data[i][2]+" "+data[i][4]
+'</div><div class="col col-4" data-label="進度狀態">'+data[i][3]+'</div></li>')
      }

    };
  };
  dataExport=dataExport.concat(ed);
  // 回傳JSON
  console.log(dataExport.join(""));
  return ContentService.createTextOutput(dataExport.join(""));
  }
