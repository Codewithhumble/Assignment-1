const http =require('http');
const fs = require('fs');
const port =3000;
http.createServer((req,resp)=>{
   
const URL=req.url;
switch(URL){
    case '/':
        fs.readFile(__dirname+ '/index.html' , (err, data)=>{
            resp.setHeader('CONTENT-TYPE' ,'text/html');
            if(err)
            {
                resp.write(err);
            }
            else{
                resp.write(data);
            }
            resp.end();
        });
        break;
    case'/css/style.css':
        fs.readFile(__dirname+ '/css/style.css' , (err, data)=>{
            resp.setHeader('CONTENT-TYPE' ,'text/css');
            if(err)
            {
                resp.write(err);
            }
            else{
                resp.write(data);
            }
            resp.end();
        });
    break;

    case '/img/img01.jpg':
        fs.readFile(__dirname+ '/img/img01.jpg' , (err, data)=>{
            resp.setHeader('CONTENT-TYPE' ,'text/css');
            if(err)
            {
                resp.write(err);
            }
            else{
                resp.write(data);
            }
            resp.end();
        });
    break;
    case '/img/main-img.jpg':
        fs.readFile(__dirname+ '/img/main-img.jpg' , (err, data)=>{
            resp.setHeader('CONTENT-TYPE' ,'text/css');
            if(err)
            {
                resp.write(err);
            }
            else{
                resp.write(data);
            }
            resp.end();
        });
    break;

    
    default:
        resp.write(URL+"FILE NOT FOUND");
        resp.end();
        
        break;
}

}).listen(port , ()=>{
console.log(`http://localhost:${port} started`);
});