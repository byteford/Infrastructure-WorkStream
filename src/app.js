/* eslint-disable no-restricted-syntax */
const express = require('express');
const exphbs = require('express-handlebars');
const path = require('path');
const fs = require('fs');
const { Blog } = require('./blog');

const app = express();

app.use(express.urlencoded({
  extended: true,
}));

const hbs = exphbs.create({
  extname: 'handlebars',
  layoutsDir: './src/views/layouts',
  defaultLayout: 'main',
});

app.set('views', `${__dirname}/views`);
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');
app.set('views', './src/views');

app.get('/', (req, res) => {
  const blognames = fs.readFileSync('./blogs/blognames.txt').toString().split('\n');
  res.render('home', { blognames });
});

app.get('/blog/:filename', (req, res) => {
  const { filename } = req.params;
  const blog = new Blog(path.join(__dirname, `../blogs/${filename}.txt`).toString(), filename);
  blog.loadBlog().then(() => {
    res.render('blog', { blog });
  });
});

app.get('/create', (req, res) => {
  res.render('create');
});

app.post('/save-blog', (req, res) => {
  const title = req.body.blogTitle;
  const content = req.body.blogContent;

  fs.writeFileSync(path.join(__dirname, `../blogs/${title}.txt`).toString(), content, (writeError) => {
    if (writeError) throw writeError;
  });

  fs.appendFileSync(path.join(__dirname, '../blogs/blognames.txt').toString(), `${title}\n`, async (appendError) => {
    if (appendError) throw appendError;
  });

  const blognames = fs.readFileSync('./blogs/blognames.txt').toString().split('\n');
  res.render('home', { message: 'Your blog was created successfully', blognames });
});

app.get('/delete/:title', (req, res) => {
  const { title } = req.params;
  fs.unlinkSync(path.join(__dirname, `../blogs/${title}.txt`).toString());

  let blognames = fs.readFileSync('./blogs/blognames.txt').toString().split('\n');
  blognames = blognames.filter((blogname) => blogname !== title);

  blognames = blognames.join('\n');
  // eslint-disable-next-line no-console
  console.log(`blogs: ${blognames}`);
  fs.writeFileSync(path.join(__dirname, '../blogs/blognames.txt').toString(), blognames, (writeError) => {
    if (writeError) throw writeError;
  });

  blognames = fs.readFileSync('./blogs/blognames.txt').toString().split('\n');

  res.render('home', { message: 'Your blog was successfully deleted', blognames });
});

app.listen(3000, () => {
  /* eslint-disable no-console */
  console.log('Listening on port 3000...');
  /* eslint-enable no-console */
});
