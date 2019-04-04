Select * from ImportPlantCoverageCommunity
Select * from ImportPlantCoverageCommunityUnit
Select * from ImportPlantCoveragePSID


Create  table #table(id int , datat int)
Create table #table1  (id int , datat int)
--insert into #table values(1,1)
--insert into #table1 values(1,null)

Select * from #table
Select * from #table1


Select * from #table t inner join #table1 t2 on t.datat = t2.datat

Select * from #table t Left join #table1 t2 on t.datat = t2.datat

Select * from #table t Right join #table1 t2 on t.datat = t2.datat

Select * from #table t Full join #table1 t2 on t.datat = t2.datat

Select * from #table t Cross join #table1 t2 

;With CTE 
As
(
Select id , ROW_NUMBER() over(partition by id order by id) r from #table1
)
delete from cte where r > 1


Java script Array
var cars = ["A", "B", "C"]


java script object 
var person = {firstName : "ID" , lastName = "AA"  , age= "DATATA"};  --The object (person) in the example above has 4 properties: firstName, lastName, age.
Accessing Object Properties
You can access object properties in two ways:

person.firstName
or

person["firstName"]

The typeof Operator
You can use the JavaScript typeof operator to find the type of a JavaScript variable.
The typeof operator returns the type of a variable or an expression:
typeof ""             // Returns "string"
typeof "John"         // Returns "string"
typeof "John Doe"     // return string
typeof 1              // number

Undefined
In JavaScript, a variable without a value, has the value undefined. The type is also undefined.
Example
var car;

Empty Values
An empty value has nothing to do with undefined.
An empty string has both a legal value and a type.

var car = "";    // The value is "", the typeof is "string"

Null
In JavaScript null is "nothing". It is supposed to be something that doesnt exist.
Unfortunately, in JavaScript, the data type of null is an object.
You can consider it a bug in JavaScript that typeof null is an object. It should be null.
You can empty an object by setting it to null:

Example
var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
person = null;    // Now value is null, but type is still an object


Difference Between Undefined and Null
undefined and null are equal in value but different in type:

typeof undefined           // undefined
typeof null                // object

null === undefined         // false
null == undefined          // true

JAVA script Function
A JavaScript function is a block of code designed to perform a particular task.
A JavaScript function is executed when "something" invokes it (calls it).

Example
function fun1(P1,p2)
{
return p1 * P2;
}

The this Keyword
In a function definition, this refers to the "owner" of the function.

In the example above, this is the person object that "owns" the fullName function.

In other words, this.firstName means the firstName property of this object.

The jQuery noConflict() Method
The noConflict() method releases the hold on the $ shortcut identifier, so that other scripts can use it.
var jq = $.noConflict();
jq(document).ready(function(){
  jq("button").click(function(){
    jq("p").text("jQuery is still working!");
  });
});

A callback function is executed after the current effect is 100% finished.

jQuery Callback Functions
JavaScript statements are executed line by line. However, with effects, the next line of code can be run even though the effect is not finished. This can create errors.

To prevent this, you can create a callback function.

A callback function is executed after the current effect is finished.
The example below has a callback parameter that is a function that will be executed after the hide effect is completed:

Example with Callback
$("button").click(function(){
  $("p").hide("slow", function(){
    alert("The paragraph is now hidden");
  });
});

jQuery - Chaining
With jQuery, you can chain together actions/methods.

Chaining allows us to run multiple jQuery methods (on the same element) within a single statement.
$("#p1").css("color", "red").slideUp(2000).slideDown(2000);

What is Traversing?
jQuery traversing, which means "move through", are used to "find" (or select) HTML elements based on their relation to other elements. Start with one selection and move through that selection until you reach the elements you desire.

jQuery - AJAX Introduction
AJAX is the art of exchanging data with a server, and updating parts of a web page - without reloading the whole page.

What is AJAX?
AJAX = Asynchronous JavaScript and XML.

In short; AJAX is about loading data in the background and display it on the webpage, without reloading the whole page.

Examples of applications using AJAX: Gmail, Google Maps, Youtube, and Facebook tabs.

The load() method loads data from a server and puts the returned data into the selected element.

Syntax:

$(selector).load(URL,data,callback);
It is also possible to add a jQuery selector to the URL parameter.


jQuery - AJAX get() and post() Methods
The jQuery get() and post() methods are used to request data from the server with an HTTP GET or POST request.

HTTP Request: GET vs. POST
Two commonly used methods for a request-response between a client and server are: GET and POST.

GET - Requests data from a specified resource
POST - Submits data to be processed to a specified resource
GET is basically used for just getting (retrieving) some data from the server. Note: The GET method may return cached data.

POST can also be used to get some data from the server. However, the POST method NEVER caches data, and is often used to send data along with the request.

jQuery $.post() Method
The $.post() method requests data from the server using an HTTP POST request.
$("button").click(function(){
  $.post("demo_test_post.asp",
  {
    name: "Donald Duck",
    city: "Duckburg"
  },
  function(data, status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});

Syntax:

$.post(URL,data,callback);

jQuery $.get() Method
The $.get() method requests data from the server with an HTTP GET request.

Syntax:

$.get(URL,callback);
$("button").click(function(){
  $.get("demo_test.asp", function(data, status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});

The ajax() method is used to perform an AJAX (asynchronous HTTP) request.

$.ajax() method allows you to send asynchronous http requests to submit or retrieve data from the server without reloading the whole page.
$.ajax() can be used to send http GET, POST, PUT, DELETE etc. request. It can retrieve any type of response from the server.

All jQuery AJAX methods use the ajax() method. This method is mostly used for requests where the other methods cannot be used.
$("button").click(function(){
  $.ajax({
       url: "@Url.Action("FirstAjax", "AjaxTest")'",   -- url: "../../Home/FirstAjax",    url: "/Home/GetSecuredData",  
	   data : { myData: 'This is my data.' },  // data to submit  JSON.stringify(model_data), 
	    type: "Post",
	     dataType : 'json' ,
		 contentType : "application/json; charset=utf-8",
		 success: function(data, status, xhr) { alert('Success'); },
         error: function() { alert('A error'); }
		 });
 });

JSON.stringify turns a JavaScript object into JSON text and stores that JSON text in a string.
JSON.parse turns a string of JSON text into a JavaScript object.

JSON.parse() is for "parsing" something that was received as JSON.
JSON.stringify() is to create a JSON string out of an object/array.

JSON.parse() takes a JSON string and transforms it into a JavaScript object. JSON.stringify() takes a JavaScript object and transforms it into a JSON string.

const myObj = {
  name: 'Skip',
  age: 2,
  favoriteFood: 'Steak'
};

const myObjStr = JSON.stringify(myObj);

console.log(myObjStr);
// "{"name":"Skip","age":2,"favoriteFood":"Steak"}"

console.log(JSON.parse(myObjStr));
// Object {name:"Skip",age:2,favoriteFood:"Steak"}
