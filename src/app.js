const express = require('express');
const exphbs = require('express-handlebars');
// const blog = require('./blog');
const app = express();

app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.get('/', (req, res) => {
  res.render('home');
});

app.listen(4000, () => {
  /* eslint-disable no-console */
  console.log('Listening on port 3000...');
  /* eslint-enable no-console */
});
