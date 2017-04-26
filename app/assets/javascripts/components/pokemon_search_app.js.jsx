class PokemonSearchApp extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      searchString: "",
      pokemons: this.props.pokemons || []
    }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleScroll = this.handleScroll.bind(this)
  }

  handleScroll(e) {
    let scrollTop = $(document).scrollTop()
    let windowHeight = $(window).height();
    let height = $(document).height() - windowHeight;
    let scrollPercentage = (scrollTop / height);

    if(scrollPercentage > 0.8) {
      $.get("/api/pokesearch?search="+ this.state.searchString, function(response){
        this.setState({pokemons: response})
      }.bind(this))
    }
  }
  handleChange(e) {
    this.setState({searchString: e.target.value})
  }

  handleSubmit(e) {
    e.preventDefault()
    $.get("/api/pokesearch?search="+ this.state.searchString, function(response){
      this.setState({pokemons: response})
    }.bind(this))
}

  render () {
    return (
      <div onScroll={this.handleScroll}>
        <form className="center" onSubmit={this.handleSubmit}>
          <input value={this.state.searchString} placeholder="Search pokémon" onChange={this.handleChange} />
            <button type="submit" className="btn btn-success center">Search!</button>
        </form>
        { this.state.pokemons.map(function(pokemon){
          return (<div>
            <h1 className="center varela fade-in">{ pokemon.name }</h1>

            <center>
              <a href={'http://bulbapedia.bulbagarden.net/wiki/' + pokemon.name }>
                    <img className="image-ctr border fade-in" src={ `${pokemon.sprite}` } />
              </a>
            </center>
            <h3 className="center varela fade-in">Type: { pokemon.pk_type }</h3>
            <h3 className="center varela fade-in">Pokémon number: { pokemon.order }</h3>
            <h3 className="center varela fade-in">Height: { pokemon.height } inches</h3>
            <h3 className="center varela fade-in">Weight: { pokemon.weight } lbs</h3>



          </div>)
        }) }
      </div>
    );
  }
}
