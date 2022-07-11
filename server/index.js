//Import Packages
const express = require("express");
const mongoose = require('mongoose');


//Import Files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");


//Initialization
const PORT = 3000;
const app = express();
const DB = "mongodb://Scud:scudetto32@ac-ukb2jsz-shard-00-00.vxzhrzl.mongodb.net:27017,ac-ukb2jsz-shard-00-01.vxzhrzl.mongodb.net:27017,ac-ukb2jsz-shard-00-02.vxzhrzl.mongodb.net:27017/?ssl=true&replicaSet=atlas-oyx82x-shard-0&authSource=admin&retryWrites=true&w=majority"

//Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//Connection
mongoose.
    connect(DB).then(() => {
    console.log('Connection Successful');
    })
    .catch((e) => {
        console.log(e);
    });


app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT} yes`);
});

