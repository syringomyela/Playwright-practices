import { Page } from 'playwright';

class BasePage {
  constructor(page) {
    this.page = page;
  }


    async goto(url) {
        await this.page.goto(url);
    }

  getElementBySelector(selector) {
    return this.page.locator(selector);
  }

  getElementByText(selector) {
    return this.page.getByText(selector, { exact: true });
  }

  getElementByRole(selector) {
    return this.page.getByRole(selector)
  }

  getElementByLabel(selector) {
    return this.page.getByLabel(selector);
  }

  getDate() {
    return this.page.inputValue('#dateOfBirthInput');
  }
}

export { BasePage };
