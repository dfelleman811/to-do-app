describe('login negative', () => {

    it('should not login with incorrect credentials', async () => {

        await browser.url('/login')

        await (await $('#username')).setValue('doesalot')
        await (await $('#password')).setValue('incorrect password')

        await $("//div/input[@type='submit']").click()

        const heading = await $('//h1').getText()

        await expect(heading).toEqual('Log in')

    })
})