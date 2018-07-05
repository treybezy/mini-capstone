// var recipeTemplate = document.querySelector('#mini-card');
// var recipeRowElement = document.querySelector('.row');
// recipeRowElement.appendChild(recipeTemplate.content.cloneNode(true));

// recipeRowElement.appendChild(recipeTemplate.content.cloneNode(true));recipeRowElement.appendChild(recipeTemplate.content.cloneNode(true));recipeRowElement.appendChild(recipeTemplate.content.cloneNode(true));recipeRowElement.appendChild(recipeTemplate.content.cloneNode(true));recipeRowElement.appendChild(recipeTemplate.content.cloneNode(true));recipeRowElement.appendChild(recipeTemplate.content.cloneNode(true))





var ProductsIndex = {
  template: '#products-index-page',
  data: function() {
    return {
      products: []
    };
  },

created: function() {
  axios
  .get("/products")
  .then(function(response) {
    this.products = response.data
  }.bind(this))
},
}
var ProductsNew = {
  template: "#products-new",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      attack_bonus: "",
      str_bonus: "",
      image_url: "",
      errors: []
    };
  },
}
  var ShoppingCart = {
  template: "#products-new",
  data: function() {
    return {
      user_id: "",
      product_id: "",
      quantity: "",
      status: "",
      order_id: "",
      image_url: "",
      errors: []
    };
  },
}
var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};
var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
    })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};
var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
  { path: "/signup", component: SignupPage },
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage },
  { path: "/products", commponent: ProductsIndex},
  { path: "/products/new", component: ProductsNew},
  { path: "/shoppingcart", component: ShoppingCart}

        ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }

});










































