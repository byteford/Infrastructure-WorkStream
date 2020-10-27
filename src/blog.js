class Blog {
  constructor(filename) {
    this.Title = '';
    this.Summary = '';
    this.Body = '';
    this.Filename = filename;
    this.LoadBlog();
  }

  GetTitle() {
    return this.Title;
  }

  GetSumary() {
    return this.Summary;
  }

  GetBody() {
    return this.Body;
  }

  LoadBlog() {
    console.log(this.Filename);
  }
}
export default Blog;
