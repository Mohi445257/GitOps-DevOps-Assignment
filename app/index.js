const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const sha = process.env.GIT_SHA || 'unknown';

app.get('/', (req, res) => {
  res.send(`Hello from weDevs DevOps demo! (image tag: ${sha})`);
});

app.listen(port, () => {
  console.log(`Listening on ${port}`);
});
