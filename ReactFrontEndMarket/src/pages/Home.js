import React, { useEffect } from 'react'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
const Home = ({ products, setProducts, gelenFavori, setgelenFavori, cart, setCart, handleClose, show, handleClosef, showf, favori, setFavori, user, currentuser }) => {





    const getTotalPrice = () => {
        if (cart.length === 0) {
            return 0; // Eğer sepet boşsa toplam fiyat 0
        }

        // Sepetteki her ürünün fiyatını miktarıyla çarpar ve toplar
        const totalPrice = cart.reduce((accumulator, currentItem) => {
            return accumulator + currentItem.productprice * currentItem.productquantity;
        }, 0);

        return totalPrice;
    };

    console.log(gelenFavori)

    const getProduct = async () => {
        const url = "https://localhost:7287/api/Product";
        const response = await fetch(url);
        const result = await response.json();
        setProducts(result);

    }
    const getFavori = async () => {
        const url = `https://localhost:7287/api/Favori/${currentuser.id}`;
        const response = await fetch(url);
        const result = await response.json();
        setgelenFavori(result);

    }
    const addCart = (item) => {
        let quantity = 1;

        if (cart === undefined || cart.length === 0) {
            // Eğer sepet boşsa veya tanımlanmamışsa yeni bir sepet oluştur
            setCart([{ id: item.id, productname: item.name, productprice: item.newPrice, productquantity: quantity }]);
        } else {
            // Eğer sepet doluysa
            let productExists = false;

            // Ürün zaten sepette var mı kontrol et
            const updatedCart = cart.map((cartItem) => {
                if (cartItem.productname === item.name) {
                    // Eğer ürün sepette varsa, miktarını artır
                    productExists = true;
                    return {
                        ...cartItem,
                        productquantity: cartItem.productquantity + 1,
                    };
                }
                return cartItem;
            });

            if (!productExists) {
                // Eğer ürün sepette yoksa, yeni bir öğe olarak ekle
                updatedCart.push({ id: item.id, productname: item.name, productprice: item.newPrice, productquantity: quantity });
            }

            // Güncellenmiş sepeti ayarla
            setCart(updatedCart);
        }
    };

    const addwishList = async (item) => {

        const newFavori = {
            "productId": item.id,
            "userId": currentuser.id,
        }
        await fetch("https://localhost:7287/api/Favori", {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify(newFavori),
        })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                alert("Favori ürünler düzenlendi")
            })

        getFavori()
    };
    const takeOrder = () => {

        const newOrder = {
            "userId": currentuser.id,
            "products": cart,
        }

        fetch("https://localhost:7287/api/OrderProducts", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify(newOrder),
        })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                alert("sipariş oluşturuldu.")
            })

    }


    useEffect(() => {
        getProduct();
        getFavori();
    }, [])

    // console.log(products)
    // console.log(cart)
    // console.log(currentuser)
    // console.log(cart)
    // console.log(favori)
    console.log(gelenFavori)

    return (
        <div>
            <div className='product-container container'>
                <div className='row gap-4'>
                    {
                        products && products.map((i, index) =>
                            <div key={index} className="card col-4" style={{ width: '18rem' }}>
                                <div onClick={() => addwishList(i)} className=' justify-content-end d-flex'> <i id="kalp" className=" fa-regular fa-heart  p-2"></i></div>
                                <img src={i.image} className="card-img-top" alt="..." />
                                <div className="card-body">
                                    <div className="card-title d-flex align-items-center justify-content-center  ">
                                        <h5 >{i.name}</h5>

                                    </div>
                                    <p className="card-text">{i.description}</p>
                                    <div className='price d-flex gap-2 justify-content-center'>
                                        <p className="card-text text-decoration-line-through text-danger ">Before ${i.oldPrice}</p>
                                        <p className="card-text text-success">Now ${i.newPrice}</p>
                                    </div>
                                    <button onClick={() => { addCart(i) }} className="btn btn-primary">Add to Cart</button>
                                </div>
                            </div>
                        )
                    }
                </div>
            </div>
            <div id='cartModal'>
                <Modal show={show} onHide={handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>Your Cart</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Unit Price</th>
                                    <th scope="col">Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                {
                                    cart && cart.map((i) =>
                                        <tr>
                                            <td>{i.productname}</td>
                                            <td>${i.productprice}</td>
                                            <td>x{i.productquantity}</td>
                                        </tr>
                                    )
                                }
                            </tbody>
                            {cart && <tfoot>
                                <tr>
                                    <th colSpan="2">Total Price</th>
                                    <th colSpan="1">${getTotalPrice()}</th>
                                </tr>
                            </tfoot>}
                        </table>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleClose}>
                            Close
                        </Button>
                        <Button variant="primary" onClick={() => { handleClose(); takeOrder() }}>
                            Take Order
                        </Button>
                    </Modal.Footer>
                </Modal>
            </div>
            <div id='wishlistModal'>
                <Modal show={showf} onHide={handleClosef}>
                    <Modal.Header closeButton>
                        <Modal.Title>Your Favorites</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Favorited ProductIds</th>

                                </tr>
                            </thead>
                            <tbody>
                                {
                                    gelenFavori && gelenFavori.map((i) => i.isDeleted === false &&
                                        <tr>
                                            <td>{i.productId}</td>

                                        </tr>
                                    )
                                }
                            </tbody>

                        </table>
                    </Modal.Body>

                </Modal>
            </div>

        </div>
    )
}

export default Home