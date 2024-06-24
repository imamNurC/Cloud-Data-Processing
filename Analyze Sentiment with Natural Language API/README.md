## Overview

The [Natural Language API](https://cloud.google.com/natural-language/?hl=en) is a pretrained machine learning model that can analyze syntax, extract entities, and evaluate the sentiment of text. You can call the Natural Language API from Google Docs to perform all of these functions.

This lab focuses on calling the Natural Language API from Google Docs. You use the Natural Language API to recognize the sentiment of selected text in a Google Doc and highlight it based on that sentiment.

When you complete this lab, you are able to select text in a document and mark its sentiment, using a menu choice, as shown below.


![Natural Language API](https://cdn.qwiklabs.com/vXt7L2%2BkcNJro4KFPO%2FrCeF4d%2FAyzY437h%2BZCU4G15A%3D)


Text is highlighted in red for negative sentiment, green for positive sentiment, and yellow for neutral sentiment.

![img1](https://cdn.qwiklabs.com/IoyZgJNSn%2BYd1xXs0cZebDMilMdNEcTxSNsP2EiEobM%3D)

## What you'll learn

In this lab, you learn how to:

- Call the Natural Language API from Google Docs
- Add menus to Google Docs
- Recognize and work with selected text in Google Docs


## How to use the script?
1. Create a new Google Doc.
2. From within your new document, select the menu item Extensions > Apps Script.
3. On the menu bar, click Save project (Save project button). (The script's name is shown to end users in several places, including the authorization dialog.)
4. Reload the document to see the new menu, Natural Language Tools, which you created, appear in the Google Docs toolbar.
5. Select text and then the Mark Sentiment option from the Natural Language Tools menu. The first time you select this option, you are prompted to authorize the script to run. Click Continue, and then confirm your account and allow
6. Once the script is authorized, the selected text is highlighted in yellow, since the stub for sentiment analysis always returns 0.0, which is neutral(yellow).
7. Call Natural Language API

