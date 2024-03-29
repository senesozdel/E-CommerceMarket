import React,{useState} from 'react'

const SignUp = () => {

  const [userName, setUserName] = useState("")
  const [password, setPassword] = useState("")
  const [email, setEmail] = useState("")

  const Register = () => {
    const newUser = {
        "name": userName,
        "email": email,
        "password": password,
        "surName":""
    }
    fetch("https://localhost:7287/api/User", {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(newUser),
  })
      .then(response => response.json())
      .then(data => {
          console.log('Success:', data);
          alert("kayıt başarılı")
      })



  }
  return (
    <section className="login-register-area">
            <div className="container d-flex justify-content-center">
        <div className="w-50  login-register-content ">
          <div className="login-register-title mb-30">
            <h2>Register</h2>
            <p>Create new account today to reap the benefits of a personalized shopping experience. </p>
          </div>
          <div className="login-register-style">
            <form action="#" method="post">
              <div className="login-register-input">
              <input  onChange={(e) => setUserName(e.target.value)} type="text" name="user-name" placeholder="User Name" />
              </div>
              <div className="login-register-input">
              <input  onChange={(e) => setEmail(e.target.value)} name="user-email" placeholder="Email" type="email" />
              </div>
              <div className="login-register-input">
              <input  onChange={(e) => setPassword(e.target.value)} type="password" name="user-password" placeholder="Password" />
              </div>
              <div className="login-register-paragraph">
                <p>Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our <a href="#">privacy policy.</a></p>
              </div>
              <div className="btn-style-3">

                <button className="btn"  onClick={() => Register()} type="button">Register</button>
              </div>
            </form>

          </div>
        </div>
      </div>
    </section>
  )
}

export default SignUp