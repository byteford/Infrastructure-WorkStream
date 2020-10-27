const express = require('express');
const exphbs = require('express-handlebars');

const app = express();

app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.get('/', (req, res) => {
  res.render('home');
});

app.listen(3000, () => {
  /* eslint-disable no-console */
  console.log('Listening on port 3000...');
  /* eslint-enable no-console */
});
