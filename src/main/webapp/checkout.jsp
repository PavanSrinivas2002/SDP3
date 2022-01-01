<html>
<head>

<title></title>
<script src="js/checkout.js"></script>
 <link rel="stylesheet" href="css/checkout.css">
</head>
<body>
<div id="app" v-cloak>
  <div class="header">

  <nav class="indigo darken-4">
    <div class="nav-wrapper container">
      <a href="#" class="brand-logo">eCommerce Checkout Demo<i class="material-icons">shopping_cart</i></a>
    </div>
  </nav>
      <div class="progress-container hide-on-med-and-up">
      <div class="progress-bar js-progress-bar"></div>
    </div>   
  </div>
  <div class="container wrapper">
    <div class="row hide-on-med-and-up" v-cloak>
      <div class="col s12 m6">
        <div class="card">
          <div class="card-content">
            <p><b>Items in cart:</b> {{cartSummary.length}}</p>
            <p><b>Shipping:</b> {{chosenShippingMethod.name}} - ${{shippingPrice}}</p>
            <p><b>Total:</b> ${{basketTotal}}</p>
            <span class="small-text grey-text text-darken-2 m-top-10 ">Fill out the information below and go directly to payment by clicking the button.</span>
          </div>
          <a v-on:click="scrollToBottom(); $v.name.$touch(); $v.address.$touch(); $v.email.$touch(); $v.phone.$touch();" class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">arrow_downward
</i></a>
        </div>

      </div>
    </div>
    <div class="row">
      <div class="col s12 m6">
        <div class="card" id="step-1">
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4"><b>Information</b></span>
            <div class="row m-top-15">
              <form class="col s12">
                <div class="row">
                  <div class="input-field col s12 l6 m-top-15">
                    <input id="first_name" @blur="$v.name.$touch()" :class="{'invalid': $v.name.$error}" v-model="name" type="text" autocomplete="name">
                    <label for="first_name">Full name</label>
                    <span v-if="$v.name.$error" class="helper-text" data-error="Please fill out full name">Helper text</span>

                  </div>
                  <div class="input-field col s12 l6 m-top-15">
                    <input id="company" v-on:blur="setCompanyShipping" v-model="company" type="text" class="validate">
                    <label for="company">Company (optional)</label>
                  </div>
                </div>
                <div class="row m-top-15">
                  <div class="input-field col s12 autocomplete-container">
                    <input class="js-autocomplete-input" id="dawa-autocomplete-input" @blur="$v.address.$touch()" :class="{'invalid': $v.address.$error}" v-model="addressInput" type="url" class="validate" autocomplete="false">
                    <label for="dawa-autocomplete-input">Full address</label>
                    <span v-if="$v.address.$error" class="helper-text" data-error="Please fill out full address">Helper text</span>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12 l6 m-top-15">
                    <input @blur="$v.email.$touch()" :class="{'invalid': $v.email.$error}" id="email" v-model="email" type="text" class="validate" autocomplete="email">
                    <label for="email">Email</label>
                    <span v-if="$v.email.$error" class="helper-text" data-error="Please fill out email">Helper text</span>
                  </div>
                  <div class="input-field col s12 l6 m-top-15">
                    <input @blur="$v.phone.$touch()" :class="{'invalid': $v.phone.$error}" id="phone" v-model="phone" type="text" class="validate" autocomplete="tel">
                    <label for="phone">Phone
                    </label>
                    <span v-if="$v.phone.$error" class="helper-text" data-error="Please fill out phone">Helper text</span>
                  </div>
                </div>
                <label class="d-block m-top-15">
                  <input type="checkbox" v-model="showAlternative" class="filled-in" />
                  <span>Choose alternative delivery</span>
                </label>

                <div v-if="showAlternative" class="m-top-15">
                  <div class="row m-top-15" v-if="showAlternative">
                    <div class="input-field col s12 l6">
                      <input id="del_first_name" v-model="delName" type="text" class="validate">
                      <label for="del_first_name">Full name</label>
                    </div>
                    <div class="input-field col s12 l6">
                      <input id="del_company" v-model="delCompany" type="text" class="validate">
                      <label for="del_company">Company (optional)</label>
                    </div>
                  </div>
                  <div class="row m-top-15">
                    <div class="input-field col s12 autocomplete-container">
                      <input class="autocomplete" id="del_address" class="validate" v-model="delAddressInput" type="text" class="validate" autocomplete="shipping street-address">
                      <label for="del_address">Full address</label>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="card" id="step-2" v-cloak>
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4"><b>Shipping</b></span>
            <p>Pleasse choose your desired shipping provider.</p>
            <form action="#">
              <p class="p-top-10" v-for="(shippingMethod, index) in shippingMethods">
                <label>
                  <input v-model="shipping" name="group1" :value="shippingMethod.id" type="radio" :id="shippingMethod.id" class="with-gap m-top-15" />
                  <span>{{shippingMethod.desc}} - ${{shippingMethod.price}}</span>
                </label>
              </p>
            </form>
            <span class="card-title activator grey-text text-darken-4 m-top-15 p-top-10"><b>Voucher</b></span>
            <label v-if="!showVoucher" class="d-block m-top-15">
                  <input type="checkbox" v-model="showVoucher" class="filled-in" />
                  <span>I have a voucher code</span>
                </label>
            <div v-if="showVoucher" class="row m-top-10 p-top-10">
              <div class="input-field col s12 l6">
                <input id="voucher" type="text" class="validate">
                <label for="voucher">Voucher</label>
              </div>
              <div class="col s12 l6">
                <a class="waves-effect waves-light btn indigo darken-4 m-top-10">Add voucher</a>
              </div>

            </div>
          </div>
        </div>
        <div class="card" id="step-3" v-cloak>
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4"><b>Maybe you could also be interested in...</b></span>
            <div class="row m-top-15">
              <swiper ref="awesomeSwiper" :options="swiperOptions">
                <!-- slides -->
                <swiper-slide>
                  <div class="card">
                    <div class="card-image">
                      <img src="https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=4505ad993e9162d9ccf05d2670a26916&auto=format&fit=crop&w=260&h=200&q=80">
                      <a class="btn-floating halfway-fab waves-effect waves-light indigo darken-4"><i class="material-icons">shopping_basket</i></a>
                    </div>
                    <div class="card-content">
                      <span class="flow-text">Nike Sneakers</span>
                      <div class="row">
                        <div class="d-block input-field col m5">
                          <select>
                          <option value="" disabled>Size</option>
                          <option v-if="index > 3" v-for="(n, index) in 14" :value="n">US {{n}}</option>
                        </select>
                        </div>
                        <div class="d-block input-field col m7">
                          <span class="related__product-price">$119</span>
                          <span class="related__product-price related__product-price--before grey-text text-darken-1">$179</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </swiper-slide>
                <swiper-slide>
                  <div class="card">
                    <div class="card-image">
                      <img src="https://images.unsplash.com/photo-1492633030546-6236e2bf198e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5b00986edb7e47d2ff61ded3dd30f1b7&auto=format&fit=crop&w=260&h=200&q=80">
                      <a class="btn-floating halfway-fab waves-effect waves-light indigo darken-4"><i class="material-icons">shopping_basket</i></a>
                    </div>
                    <div class="card-content">
                      <span class="flow-text">Nike t-shirt</span>
                      <div class="row">
                        <div class="d-block input-field col m5">
                          <select>
                          <option value="" disabled>Size</option>
                          <option v-for="(size, index) in sizes" :value="size">{{size}}</option>
                        </select>
                        </div>
                        <div class="d-block input-field col m7">
                          <span class="related__product-price">$65</span>
                          <span class="related__product-price related__product-price--before grey-text text-darken-1">$99</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </swiper-slide>
                <swiper-slide>
                  <div class="card">
                    <div class="card-image">
                      <img src="https://images.unsplash.com/photo-1484071096222-7936a931e094?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a4578f1107f7896f8f02bd701a6d3d52&auto=format&fit=crop&w=260&h=200&q=80">
                      <a class="btn-floating halfway-fab waves-effect waves-light indigo darken-4"><i class="material-icons">shopping_basket</i></a>
                    </div>
                    <div class="card-content">
                      <span class="flow-text">Unsplash socks</span>
                      <div class="row">
                        <div class="d-block input-field col m5">
                          <select>
                          <option value="" disabled>Size</option>
                          <option v-if="index > 3" v-for="(n, index) in 14" :value="n">US {{n}}</option>
                        </select>
                        </div>
                        <div class="d-block input-field col m7">
                          <span class="related__product-price">$5</span>
                          <span class="related__product-price related__product-price--before grey-text text-darken-1">$15</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </swiper-slide>
                <swiper-slide>
                  <div class="card">
                    <div class="card-image">
                      <img src="https://images.unsplash.com/photo-1463100099107-aa0980c362e6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b7d1df3fbecb8923c40cd429b2add590&auto=format&fit=crop&w=260&h=200&q=80">
                      <a class="btn-floating halfway-fab waves-effect waves-light indigo darken-4"><i class="material-icons">shopping_basket</i></a>
                    </div>
                    <div class="card-content">
                      <span class="flow-text">All Stars</span>
                      <div class="row">
                        <div class="d-block input-field col m5">
                          <select>
                          <option value="" disabled>Size</option>
                          <option v-if="index > 3" v-for="(n, index) in 14" :value="n">US {{n}}</option>
                        </select>
                        </div>
                        <div class="d-block input-field col m7">
                          <span class="related__product-price">$60</span>
                          <span class="related__product-price related__product-price--before grey-text text-darken-1">$80</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </swiper-slide>
                <div class="swiper-pagination" slot="pagination"></div>
                <div class="swiper-button-prev" slot="button-prev"></div>
                <div class="swiper-button-next" slot="button-next"></div>
              </swiper>

            </div>
          </div>
        </div>
      </div>
      <div class="col s12 m6">
        <div class="card" id="step-4" v-cloak>
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4"><b>Order summary</b></span>
            <div class="row info">
              <div class="col s12 m6">
                <p><b>Billing address:</b></p>
                <p>{{ name }}</p>
                <p>{{ company }}</p>
                <p>{{ addressComputed }}</p>
                <p>{{ cityComputed }}</p>
                <p>{{ email }}</p>
                <p>{{ phone }}</p>
              </div>
              <div class="col s12 m6" v-if="showAlternative">
                <p><b>Delivery address:</b></p>
                <p>{{ delName }}</p>
                <p>{{ delCompany }}</p>
                <p>{{ delAddressComputed }}</p>
                <p>{{ delCityComputed }}</p>
              </div>
            </div>
            <span class="card-title activator grey-text text-darken-4 m-top-15"><b>Your order</b></span>
            <span><b>{{ products.length }} items</b></span>
            <ul class="collection">
              <li class="collection-item avatar" ref="item-1" v-for="(product, index) in products">
                <img :src="product.image" alt="" class="circle">
                <div class="row">
                  <div class="col s12 l4">
                    <span class="title">{{ product.name }}</span>
                    <p>${{ product.price }}</p>
                  </div>
                  <div class="input-field col s6 l2">
                    <select>
                        <option value="" disabled>Size</option>
                        <option v-for="(size, index) in sizes" :value="size" :selected="index == 2 ? 'selected' : ''">{{size}}</option>
                      </select>
                  </div>
                  <div class="input-field col s6 l2">
                    <quantity-select :product-id="product.id"></quantity-select>
                  </div>
                </div>
                <a href="#!" class="secondary-content"><i class="material-icons" v-on:click="deleteItem(product.id)">clear</i></a>
              </li>
            </ul>
            <ul>
              <li v-if="shipping">
                <span><b>Shipping</b> <i>{{chosenShippingMethod.desc}}</i></span>
                <span class="right">${{chosenShippingMethod.price}}</span>
              </li>
              <li v-if="taxTotal">
                <span><b>TAX</b></span>
                <span class="right">${{taxTotal}}</span>
              </li>
            </ul>
          </div>
          <div class="card-action" v-if="basketTotal">
            <span><b>Total</b></span>
            <span class="right"><b>${{basketTotal}}</b></span>
          </div>
          <div class="card-action">
            <span class="card-title activator grey-text text-darken-4"><b>Payment</b></span>
            <p class="payment-info">Please choose your desired payment method. Credit card option will redirect you to the payment gateway.</p>
            <p>
              <label>
                  <input type="checkbox"  class="filled-in" />
                  <span>Please sign me up for the newsletter</span>
              </label></p>
            <p>
              <label>
                  <input type="checkbox" v-model="consent" class="filled-in" />
                  <span>I hereby confirm that the information that I have provided is correct and that I accept the <a href="#" class="indigo-text text-darken-4">Terms and Conditions</a></span>
              </label></p>
            
            <a ref="link" v-on:click="goToPayment($event); $v.$touch();" href="https://mobilepay.dk/da-dk/pages/betal.aspx?phone=004512345678&amount=199" class="mobilepay">
              <img src="https://cdn.mobilepay.dk/res-website/img/buttons/paywith/dk/mpblue/medium.svg" alt="" class="src">
            </a>
            <a ref="link" v-on:click="goToPayment($event); $v.$touch();" href="https://payment.quickpay.net/payments/a4d5e59b2695e3b5c2d8b19c8112835a5e0c3365e0782a4fb7b43091b5142af9" class="waves-effect waves-light btn-credit-card blue-grey"><i class="material-icons left">credit_card</i>Pay with Credit Card</a>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>