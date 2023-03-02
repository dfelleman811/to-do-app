describe('login', () => {

    it('should login with correct credentials', async () => {

        await browser.url('/login')

        await (await $('#username')).setValue('doesalot')
        await (await $('#password')).setValue('password')

        await $("//div/input[@type='submit']").click()

        browser.waitUntil(
            async () => {
                return (await browser.getUrl()).includes("/to_dos"),
                {timeout: 5000, timeoutMsg: 'home page did not load after logging in with correct credentials'}
            }
        )
        const heading = await $('//h1').getText()
        console.log(heading)

        await expect(heading).toEqual('To Dos')

    })


})