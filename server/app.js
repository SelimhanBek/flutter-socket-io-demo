const app = require("express")();
const http = require("http").createServer(app);

app.get("/", (req, res) => {
  res.send("Node Js Socket Server is running ....");
});

//Socket Traffic
const socketio = require("socket.io")(http);

socketio.on("connection", (client) => {
  client.on("connect_on", (data) => {
    console.log(data);
    client.broadcast.emit("connect_on", data);
  });
});

app.set("port", process.env.PORT || 3000);

http.listen(app.get('port'), () => console.log('Listening on port: ' + app.get('port')));
