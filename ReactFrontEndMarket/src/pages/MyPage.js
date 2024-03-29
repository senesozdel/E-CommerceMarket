import React, { useEffect, useState } from 'react'
import { Link, Navigate, useNavigate } from 'react-router-dom'


const MyPage = ({ currentuser, setCurrentUser, order, setOrder }) => {

    const Navigate = useNavigate();
    const [detaygoster, setdetaygoster] = useState(false);

    const [fullorders, setfullorders] = useState();
    const [orderproducts, setorderproducts] = useState();
    const [ordersbyuser, setordersbyuser] = useState();

    const getFullOrders = async () => {
        const url = `https://localhost:7287/api/Order`;
        const response = await fetch(url);
        const result = await response.json();
        setfullorders(result);

    }

    const getOrderProducts = async (item) => {
        const url = `https://localhost:7287/api/OrderProducts/${item.id}`;
        const result = await fetch(url).then(response => response.json());
        setorderproducts(result);

    }

    useEffect(() => { getFullOrders() }, [])

    const logout = () => {
        Navigate("/");
        setCurrentUser();
    }



    return (
        <>
            {
                currentuser ? <section className="my-account-area">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-title text-center mb-40 mb-md-20">
                                    <h5 className="title">My account</h5>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="myaccount-page-wrapper">
                                    <div className="row">
                                        <div className="col-lg-3 col-md-4">
                                            <nav>
                                                <div className="myaccount-tab-menu nav nav-tabs" id="nav-tab" role="tablist">
                                                    <button className="nav-link active" id="dashboad-tab" data-bs-toggle="tab" data-bs-target="#dashboad" type="button" role="tab" aria-controls="dashboad" aria-selected="true">Dashboard</button>
                                                    <button className="nav-link" id="orders-tab" data-bs-toggle="tab" data-bs-target="#orders" type="button" role="tab" aria-controls="orders" aria-selected="false" tabIndex={-1}> Orders</button>
                                                    <button onClick={() => logout()} className="nav-link" type="button" aria-selected="false" tabIndex={-1} role="tab">Logout</button>
                                                </div>
                                            </nav>
                                        </div>
                                        <div className="col-lg-9 col-md-8">
                                            <div className="tab-content" id="nav-tabContent">
                                                <div className="tab-pane fade active showmodal show" id="dashboad" role="tabpanel" aria-labelledby="dashboad-tab">
                                                    <div className="myaccount-content">
                                                        <h3>Dashboard</h3>
                                                        <div className="welcome">
                                                            <p>Hello, <strong>{currentuser && currentuser.name}</strong> (If Not <strong>{currentuser && currentuser.name}!</strong><Link to={"/"} onClick={() => setCurrentUser()}> Logout</Link>)</p>
                                                        </div>
                                                        <p className="mb-0">From your account dashboard. you can easily check &amp; view your recent orders, manage your shipping and billing addresses and edit your password and account details.</p>
                                                    </div>
                                                </div>
                                                <div className="tab-pane fade" id="orders" role="tabpanel" aria-labelledby="orders-tab"  >
                                                    <div className="myaccount-content">
                                                        <h3>Orders</h3>
                                                        <div className="myaccount-table table-responsive text-center">
                                                            {
                                                                detaygoster === false ?
                                                                    <table className="table table-bordered">
                                                                        <thead className="thead-light">
                                                                            <tr>
                                                                                <th>OrderId</th>
                                                                                <th>Date</th>
                                                                                <th>Detail</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            {
                                                                                fullorders && fullorders.map((item, index) => (item.userId === currentuser.id &&
                                                                                    <tr key={index}>
                                                                                        <td>{item.id}</td>
                                                                                        <td>{item.orderDate}</td>
                                                                                        <td><button onClick={() => { getOrderProducts(item); setdetaygoster(true) }} className='btn btn-outline-success'>Go</button></td>
                                                                                    </tr>
                                                                                ))
                                                                            }
                                                                        </tbody>




                                                                    </table>
                                                                    :

                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Product Id</th>
                                                                                <th scope="col">Quantity</th>
                                                                                <th scope="col">Go Back</th>

                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            {
                                                                                orderproducts && orderproducts.map((i, index) =>
                                                                                    <tr key={index}>
                                                                                        <td>{i.productId}</td>
                                                                                        <td>{i.quantity}</td>
                                                                                        <td><button className='btn btn-outline-danger' onClick={() => setdetaygoster(false)}> Back</button></td>
                                                                                    </tr>
                                                                                )
                                                                            }
                                                                        </tbody>

                                                                    </table>
                                                            }



                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>:
                <section><h3>Sayfayı Görüntülemek İçin Giriş Yapmanız Gerekmektedir</h3></section>
            }
        </>
    )
}

export default MyPage