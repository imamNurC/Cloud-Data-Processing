function retrieveSentiment (line) {
  var apiKey = "your key here";
  var apiEndpoint = 'https://language.googleapis.com/v1/documents:analyzeSentiment?key=' + apiKey;

  //  Create a structure with the text, its language, its type,
  //  and its encoding
  var docDetails = {
    language: 'en-us',
    type: 'PLAIN_TEXT',
    content: line
  };

  var nlData = {
    document: docDetails,
    encodingType: 'UTF8'
  };

  //  Package all of the options and the data together for the call
  var nlOptions = {
    method : 'post',
    contentType: 'application/json',
    payload : JSON.stringify(nlData)
  };

  //  And make the call
  var response = UrlFetchApp.fetch(apiEndpoint, nlOptions);

  var data = JSON.parse(response);

  var sentiment = 0.0;
  //  Ensure all pieces were in the returned value
  if (data && data.documentSentiment && data.documentSentiment.score){
     sentiment = data.documentSentiment.score;
  }

  return sentiment;
}
