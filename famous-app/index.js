const express = require('express')
const app = express()
const port = 3000
app.get('/', (req, res) => {
    res.send('Hey Famous!')
})

app.get('/famous/', (req, res, next) => {
    res.send('Add an number between 1 and 3 at the end of the url, to see which famous is hidden behind...');
});

app.get("/famous/:id", (req, res, next) => {
    let famous
    switch(req.params.id){
        case "1": famous = "Socrates"
            break;   
        case "2": famous = "Plato"
            break;   
        case "3": famous = "Aristoteles"
            break;
        default: famous = 'choose only 1,2 or 3!'
    }
    console.log(famous)
    res.send(famous);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`))