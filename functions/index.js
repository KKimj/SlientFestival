const functions = require("firebase-functions");
const { firebaseConfig } = require('firebase-functions');
const {Firestore} = require('@google-cloud/firestore');

const admin = require('firebase-admin');
admin.initializeApp();

const cors = require('cors')  (  {
    origin: true
}  )   ;


exports.pages = functions.https.onRequest( (request, response) =>{ 

    cors( request, response, ()=>
    {
        if(request.method === 'GET')
        {
            
        }
        if(request.method ==='POST')
        {
            
        }
    }
    );
});

exports.groups = functions.https.onRequest( (request, response) =>{ 

    cors( request, response, ()=>
    {
        if(request.method === 'GET')
        {
            
        }
        if(request.method ==='POST')
        {
            
        }
    }
    );
});


exports.users = functions.https.onRequest( (request, response) =>{ 

    cors( request, response, ()=>
    {
        if(request.method === 'GET')
        {
            admin.firestore().collection('users').get().then(function(querySnapshot) {
                querySnapshot.forEach(function(doc) {
                    console.log(doc.id, " => ", doc.data(), doc.data().temp_body);
                    let x = {time: doc.data().time,  temp_body: doc.data().temp_body,  temp_sensor: doc.data().temp_sensor};
                    ret.push(x);
                });
                response.json(JSON.stringify(ret));
            });
        }
        if(request.method ==='POST')
        {
            // let temp_body = response.req.body.temp_body;
            // let temp_sensor = response.req.body.temp_sensor;
            // let device_name = response.req.url.split('/')[1];
            // let time = Date.now();
            // admin.firestore().collection('users/'+device_name+'/datas').doc(time.toString()).set({
            //     time : time,temp_body : temp_body, temp_sensor : temp_sensor}).then( () =>  {
            //     response.json(response.req.body);
            // }) ;
        }
    }
    );
});



// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});


curl -X POST https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=Kor -H "Content-Type: application/octet-stream"  \
-H "X-NCP-APIGW-API-KEY-ID: 03ug1j1c47" \
-H "X-NCP-APIGW-API-KEY: yFJ4aQpjR7Evsa7y9ZODgWAg4av0bPTG1uD4fhYG" \
--data "image : @sound2.mp3"


curl -X POST https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=Kor -H "Content-Type: application/octet-stream"  \
-H "X-NCP-APIGW-API-KEY-ID: 03ug1j1c47" \
-H "X-NCP-APIGW-API-KEY: yFJ4aQpjR7Evsa7y9ZODgWAg4av0bPTG1uD4fhYG" \
--data "@sound2.mp3"