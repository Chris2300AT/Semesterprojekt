const express =  require('express');
const router = express.Router();
const mongoose = require('mongoose');
const checkAuth = require('../middleware/check-auth');

const Player = require('../models/player');

router.get('/', (req, res, next) => {
    Player.find()
    .exec()
    .then(docs => {
        console.log(docs);
        res.status(200).json(docs);
    })
    .catch(err => {
        console.log(err);
        res.status(500).json({
            error: err
        })
    })
});

router.post('/', (req, res, next) => {
    const player = new Player({
        _id: new mongoose.Types.ObjectId(),
        name: req.body.name,
        winRate: 0, 
        playedGames: 0
    });
    player.save().then(result => {
        console.log(result);
        res.status(201).json({
            message: 'Handling POST requests to /products',
            createdPlayer: result
    });
    }).catch(err => {
        console.log(err)
        res.status(500).json({
            error: err
        })
    });

});

router.get('/:playerId',  (req, res, next) => {
    const id = req.params.playerId;
    Player.findById(id)
    .exec()
    .then(doc =>{
        console.log('From Database: ' + doc)
        if(doc){
            res.status(200).json(doc);
        }else{
            res.status(404).json({message: 'No valid entry found for provided ID'});
        }
        
    })
    .catch(err =>{
        console.log(err)
        res.status(500).json({error: err});
    });
});
// upload.single('productImage'),

router.patch('/:playerId', checkAuth, (req, res, next) => {
    const id = req.params.playerId;
    const updateOps = {};

    for(const ops of req.body){
        updateOps[ops.Name] = ops.value;
    }

    Player.updateOne({_id: id}, {$set: updateOps})
    .exec()
    .then(result => {
        console.log(res);
        res.status(200).json(result)})
    .catch(err => {
        console.log(err);
        res.status(500).json({
            error: err
        });
    })
});

router.delete('/:playerId', (req, res, next) => {
    const id =  req.params.playerId;
    Player.remove({_id: id})
    .exec()
    .then(res => {
        res.status(200).json(result);
    })
    .catch(err => {
        console.log(err);
        res.status(500).json({
            error: err
        })

    });
});

module.exports = router;