const fs = require('fs');

class Blog {
  constructor(filename) {
    this.Title = '';
    this.Summary = '';
    this.Body = '';
    this.Filename = filename;
    this.loadBlog();
  }

  getTitle() {
    return this.Title;
  }

  getSumary() {
    return this.Summary;
  }

  getBody() {
    return this.Body;
  }

  loadBlog() {
    fs.readFile(this.Filename, (err, data) => {
      if (err) throw err;
      this.Title = this.Filename;
      this.Body = data.toString();
    });
  }
}
module.exports = {
  Blog,
};
