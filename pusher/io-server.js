#!/usr/bin/env node

var amqp = require('amqplib/callback_api');
var io = require('socket.io').listen(3000);

io.sockets.on('connection', function(socket) {

    amqp.connect('amqp://localhost', function(err, conn) {
        conn.createChannel(function(err, ch) {
            var q = 'hello';

            ch.assertQueue(q, {durable: false});
            console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", q);
            ch.consume(q, function(msg) {
                console.log(" [x] Received %s", msg.content.toString());
                io.emit('message', msg.content.toString());
            }, {noAck: true});
        });
    });

});