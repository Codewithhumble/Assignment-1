const  response  = require('express');
const express = require('express');
const Book = require('./book');
const port= 4000;
const server=express();
const message =`http://localhost:${port} started`;
server.use(express.urlencoded({extended:true}));
server.use(express.json());
const books=[
    new Book("b101","hindi",10),
    new Book("b102","english",20),
    new Book("b103","math",30)
];

server.get('/',(req,resp)=>{
    resp.setHeader("Content-Type","application/json");
    resp.send("Express Server is working at 3000 port");
});

server.get('/index.html',(req,resp)=>{
    resp.setHeader("Content-Type","text/html")
    resp.sendFile(__dirname+"/index.html");
});

server.get('/books',(req,resp)=>{
    resp.setHeader("Content-Type","application/json");
    resp.send(books);
});

server.get('/books/:bid',(req,resp)=>{
    resp.setHeader("Content-Type","application/json");
    const bid=req.params.bid;
    book=books.find(book=>book.bid===bid);
    if(book)
    resp.send(book);
    else
    resp.status(404).send(bid+" not found");
});

server.post('/books/add' , (req,resp)=>{
resp.setHeader("Content-Type" , "application/json");
const newbooks={
    bid:req.body.bid,
    bname:req.body.bname,
    unit_price:req.body.unit_price
}
console.log(req.body.bid);
// if(books.push(newbooks)>0)
// {
//     resp.send(newbooks +"Add to records");
// }
// else{
//     resp.status(500).send("Error occure while adding" +newbooks);
// }
});
server.listen(port,()=>console.log(message));

