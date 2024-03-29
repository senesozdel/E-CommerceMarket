import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'

const Login = ({ setCurrentUser, currentuser }) => {

  const [userName, setUserName] = useState("")
  const [password, setPassword] = useState("")
  const [isChecked, setChecked] = useState(false);
const Navigate = useNavigate();
  const TokenRequest = async () => {
    const loginuser = {
      "userName": userName,
      "password": password
    };
    console.log(loginuser)
      fetch("https://localhost:7287/api/ReactTokenLogin", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(loginuser),
    })

      .then(response => response.json())
      .then(data => {
        console.log('Success:', data);
        console.log(data.tokenBody)
        sessionStorage.setItem('token',data.tokenBody)
        sessionStorage.setItem('currentUser',data.currentUser)
        setCurrentUser(data.currentUser)
      })

      Navigate("/mypage")

  };



  const handleCheckboxChange = () => {
    setChecked(!isChecked);

    if (isChecked === true) {
      TokenRequest();
    }

  };



  return (
    <div>
      <section className="login-register-area">
        <div className="container d-flex justify-content-center">
          <div className="w-50 ">
            <div className="login-register-content">
              <div className="login-register-title mb-30">
                <h2>Login</h2>
                <p>Welcome back! Please enter your username and password to login. </p>
              </div>
              <div className="login-register-style login-register-pr">
                <div >
                  <div className="login-register-input">
                    <input onChange={(e) => setUserName(e.target.value)} placeholder='User Name' />
                  </div>
                  <div className="login-register-input">
                    <input onChange={(e) => setPassword(e.target.value)} placeholder='Password' />
                    <div className="remember-me-btn" >
                      <input type="checkbox" checked={isChecked} onChange={() => handleCheckboxChange()} />
                      <label>I have read and accept the user agreement</label>
                    </div>
                  </div>
                  <div className="btn-style-3">
                    <button className="btn" onClick={() => TokenRequest()}>Login</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

    </div>
  )
}

export default Login