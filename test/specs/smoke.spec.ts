describe('smoke', () => {

    it('app loads', async () => {
        await browser.url("/")

        const header = await $('//h1')

        await expect(header).toHaveText('Log in')
    })
})