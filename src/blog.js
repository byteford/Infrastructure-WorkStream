const fs = require('fs').promises;

class Blog {
  constructor(filename) {
    this.Title = '';
    this.Summary = '';
    this.Body = '';
    this.Filename = filename;
  }

  getTitle() {
    return this.Title;
  }

  getSummary() {
    return this.Summary;
  }

  getBody() {
    return this.Body;
  }

  async loadBlog() {
    const data = await fs.readFile(this.Filename);
    this.Body = data.toString();
    this.Title = this.Filename;
  }
}
module.exports = {
  Blog,
};
