describe('logout', () => {
    it('should return to login', async () => {
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

        await $('=Logout').click()

        browser.waitUntil(
            async () => {
                return (await browser.getUrl()).includes('/login'), 
                {timeout: 5000, timeoutMsg: 'logout did not return to login page'}
            }
        )

        await expect(await $('//h1').getText()).toEqual('Log in')

    })
})