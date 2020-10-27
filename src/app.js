const express = require('express');
const exphbs = require('express-handlebars');
const { Blog } = require('./blog');

const temp = new Blog('./milestones.txt');
console.log(temp.getTitle());
const app = express();

const hbs = exphbs.create({
  extname: 'handlebars',
  layoutsDir: './src/views/layouts',
  defaultLayout: 'main',
});
app.set('views', `${__dirname}/views`);
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');

app.get('/', (req, res) => {
  res.render('home');
});

app.listen(4000, () => {
  /* eslint-disable no-console */
  console.log('Listening on port 3000...');
  /* eslint-enable no-console */
});
