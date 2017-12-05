# Food Ordering System
A spring MVC web application for online food ordering and billing, developed wif proper session management and bill printing mechanism.

## Prerequisites

Install Java. Make sure you have Java installed.

## Tomcat Installation

1.Go to https://tomcat.apache.org/download-80.cgi and download latest version of tomcat.

2.Unzip Tomcat.

## MySql

click here https://www.mysql.com/downloads/ and download latest version of mysql.

## Steps to Build Application

1. Download teh source code from git repository and extract it.

2. Build it using "mvn install" command in terminal. Now a war file gets generated.

## Steps to run Application

1. Enter http://localhost:8080 in browser.

2. Tomcat Home page will be displayed.(if any port issues found tan change teh port numbers in server.xml file)

3. Upload the war file of the application in the specified location.

4. Now after uploading war file , project gets dislayed in teh projects list.

5. Click on teh project, you will be directed to home page of application.


## Project Flow
 1.The execution stats from menu.jsp page , where  food menu will be displayed . Upon selecting an item user will be guided to order.jsp page for custumizing order and bill payment. 
 
 2.User can add any number of items to cart and after ordering, user can proceed to payment.
 
 3.Bill printing facility is provided.
 
 ## License
 MIT License

Copyright (c) [2017] [NikhilReddyPurumandla]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software wifout restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
