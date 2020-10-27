const express = require('express');
const exphbs = require('express-handlebars');

const app = express();

const hbs = exphbs.create({
  extname      :'hbs',
  layoutsDir   : './src/views/layouts',
  defaultLayout: 'main'
});

app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.set('views', './src/views');

app.get('/', (req, res) => {
  res.render('./src/views/home');
});

app.listen(3000, () => {
  /* eslint-disable no-console */
  console.log('Listening on port 3000...');
  /* eslint-enable no-console */
});
