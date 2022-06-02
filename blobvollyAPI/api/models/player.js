const mongoose = require('mongoose');

const playerSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    name: String,
    winRate: Number,
    playedGames: Number
});

module.exports = mongoose.model('Player', playerSchema);