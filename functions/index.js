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
            let ret = [];
            admin.firestore().collection('users').get().then(function(querySnapshot) {
                querySnapshot.forEach(function(doc) {
                    console.log(doc.id, " => ", doc.data(), doc.data().temp_body);
                    let x = {
                        email: doc.data().email,
                        userId: doc.data().userId,
                        userImgUrl: doc.data().userImgUrl,
                        userName: doc.data().userName
                    };
                    ret.push(x);
                });
                response.json(JSON.stringify(ret));
            });
        }
        if(request.method ==='POST')
        {
            let email = response.req.body.email;
            let userId = response.req.body.userId;
            let userImgUrl = response.req.body.userImgUrl;
            let userName = response.req.body.userName;
            
            let time = Date.now();
            admin.firestore().collection('users').doc(userId.toString()).set({
                email : email,
                userId : userId, 
                userImgUrl : userImgUrl,
                userName : userName,
            }).then( () =>  {
                response.json(response.req.body);
            }) ;
        }
    }
    );
});

exports.reviews = functions.https.onRequest( (request, response) =>{ 

    cors( request, response, ()=>
    {
        if(request.method === 'GET')
        {
            let ret = [];
            admin.firestore().collection('reviews').get().then(function(querySnapshot) {
                querySnapshot.forEach(function(doc) {
                    console.log(doc.id, " => ", doc.data(), doc.data().temp_body);
                    let x = {
                        time: doc.data().time,
                        writer: doc.data().writer,
                        name: doc.data().name,
                        lat: doc.data().lat,
                        lng: doc.data().lng,
                        pic_url: doc.data().pic_url,
                        thumbnail_url: doc.data().thumbnail_url,
                        communication: doc.data().communication,
                        kindness: doc.data().kindness,
                        rating: doc.data().rating,
                        parking: doc.data().parking,
                        comment: doc.data().comment,
                        goodvote: doc.data().goodvote,
                        badvote: doc.data().badvote,
                    };
                    ret.push(x);
                });
                response.json(JSON.stringify(ret));
            });
        }
       
        if(request.method ==='POST')
        {
            let time = Date.now();
            let writer = response.req.body.writer;
            let name = response.req.body.name;
            let lat = response.req.body.lat;
            let lng= response.req.body.lng;
            let pic_url= response.req.body.pic_url;
            let thumbnail_url= response.req.body.thumbnail_url;
            let communication= response.req.body.communication;
            let kindness= response.req.body.kindness;
            let rating= response.req.body.rating;
            let parking= response.req.body.parking;
            let comment= response.req.body.comment;
            let goodvote= response.req.body.goodvote;
            let badvote= response.req.body.badvote;
            // let temp_body = response.req.body.temp_body;
            // let temp_sensor = response.req.body.temp_sensor;
            // let device_name = response.req.url.split('/')[1];
            // let time = Date.now();
            admin.firestore().collection('reviews').doc(time.toString()).set({
                time : time,
                writer : writer,
                name : name,
                lat : lat,
                lng : lng,
                pic_url : pic_url,
                thumbnail_url : thumbnail_url,
                communication : communication,
                kindness : kindness,
                rating : rating,
                parking : parking,
                comment : comment,
                goodvote : goodvote,
                badvote : badvote,
            }).then( () =>  {
                response.json(response.req.body);
            }) ;
        }
    }
    );
});
// real test
/*
curl -X POST https://us-central1-slientfestival.cloudfunctions.net/users -H "Content-Type:application/json"  -d '{"email": abc, "userId" : abcd, "userImgUrl" : 123, "userName" : 1234}'
email: doc.data().email,
                        userId: doc.data().userId,
                        userImgUrl: doc.data().userImgUrl,
                        userName: doc.data().userName
*/

// emulator test

// GET
// curl -X GET http://localhost:5001/slientfestival/us-central1/reviews
// curl -X GET http://localhost:5001/slientfestival/us-central1/users

/*
curl -X POST https://us-central1-slientfestival.cloudfunctions.net/users -H "Content-Type:application/json"  -d '{"email": "alsthfdl6478@gmail.com", "userId" : "ParkMinSol", "userImgUrl" : "google.com/image/abcd", "userName" : "박민솔"}'
// POST
// curl -X POST http://localhost:5001/slientfestival/us-central1/users -H "Content-Type:application/json"  -d '{"email": "ziun79@gmail.com", "userId" : "kimjj", "userImgUrl" : "google.com/image/abcd", "userName" : "김지지운"}'
// curl -X POST http://localhost:5001/slientfestival/us-central1/reviews
// curl -X POST http://localhost:5001/slientfestival/us-central1/reviews -H "Content-Type:application/json"
curl -X POST http://localhost:5001/slientfestival/us-central1/reviews -H "Content-Type:application/json" \
-d '{ "writer" : 1, \
    "name" : "24시 국밥”, \
    "lat" : 37.551229, \
    "lng" : 126.988205, \
    "pic_url" : "", \
    "thumbnail_url" : "", \
    "communication" : 1,  \
    "kindness" : 1, \
    "rating" : 3, \
    "parking" : 1, \
    "comment" : "부모님이랑 매일가요. 너무 좋아요.", \
    "goodvote" : 3, \
    "badvote" : 3, \
}'
*/
// curl -X POST http://localhost:5001/slientfestival/us-central1/reviews -H "Content-Type:application/json" -d '{ "writer" : 1, \
//     "name" : "24시 국밥”, "lat" : 1, "lng" : 1, "pic_url" : "1", "thumbnail_url" : "2", "communication" : 1,  \
//  "kindness" : 1, "rating" : 3, "parking" : 1, "comment" : "부모님이랑 매일가요. 너무 좋아요.", "goodvote" : 3, "badvote" : 3}'

// curl -X POST http://localhost:5001/slientfestival/us-central1/reviews -H "Content-Type:application/json" \
// -d { "time" : 1612545916912,\
//     "writer" : 1, \
    
//     "name" : “24시 국밥”, \
//     "lat" : 37.551229, // 위도
//     "lng" : 126.988205, // 경도

//     "pic_url" : "",
//     "thumbnail_url" : "",
//     "communication" : 1, 
//     "kindness" : 1,
//     "rating" : 3,
//     "parking" : YES,
    
//     "comment" : "부모님이랑 매일가요. 너무 좋아요.",
//     "goodvote" : 3,
//     "badvote" : 3,
// }, 


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


// curl -X POST https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=Kor -H "Content-Type: application/octet-stream"  \
// -H "X-NCP-APIGW-API-KEY-ID: 03ug1j1c47" \
// -H "X-NCP-APIGW-API-KEY: yFJ4aQpjR7Evsa7y9ZODgWAg4av0bPTG1uD4fhYG" \
// --data "image : @sound2.mp3"




// 작성시간
// 작성자
// 상호명
// 위도
// 경도
// 사진 링크
// 썸네일 링크
// 소통방법
// 안내친절
// 주차
// 평점
// 경험담
// 추천수
// 신고수

// [{
//     time : 1612545916912,
//     writer : 1,
    
//     name : “24시 국밥”,
//     lat : 37.551229, // 위도
//     lng : 126.988205, // 경도

//     pic_url : "",
//     thumbnail_url : "",
//     communication : 1, 
//     kindness : 1,
//     rating : 3,
//     parking : YES,
    
//     comment : "부모님이랑 매일가요. 너무 좋아요.",
//     goodvote : 3,
//     badvote : 3,
// },
// {
//     time : 1612545928310,
//     writer : 1,
    
//     name : “24시 국밥”,
//     lat : 37.551229, // 위도
//     lng : 126.988205, // 경도

//     pic_url : "",
//     thumbnail_url : "",
//     communication : 1, 
//     kindness : 1,
//     parking : YES,
    
//     comment : "부모님이랑 매일가요. 너무 좋아요.",
//     goodvote : 3,
//     badvote : 3,
// },
// {
//     time : 0101,
//     writer : 1,
    
//     name : “24시 국밥”,
//     lat : 37.551229, // 위도
//     lng : 126.988205, // 경도

//     pic_url : "",
//     thumbnail_url : "",
//     communication : 1, 
//     kindness : 1,
//     parking : YES,
    
//     comment : "부모님이랑 매일가요. 너무 좋아요.",
//     goodvote : 3,
//     badvote : 3,
// },]

// Id : 작성시간

