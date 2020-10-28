/* eslint-disable no-undef */
/* globals Cypress cy */
describe('CI test for homepage', () => {
  // refactor with a beforeEach for cy.visit command
  it('should open the homepage and click on the blog1 link to display the correct url', () => {
    cy.visit(Cypress.env('HOST'));
    cy.get('[href="/blog/milestones.txt"] > h2').click({ force: true });
    cy.url().should('include', '/blog/');
  });

  it('should open the homepage and click on the blog1 link to display the correct blog title', () => {
    cy.visit(Cypress.env('HOST'));
    cy.get('[href="/blog/milestones.txt"] > h2').click({ force: true });
    cy.get('#blog-title').should('have.text', 'milestones.txt');
  });
});
