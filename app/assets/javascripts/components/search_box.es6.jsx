class SearchApp extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      searchString: "",
      campaigns: []
    }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleChange(e) {
    this.setState({searchString: e.target.value})
  }

  handleSubmit(e) {
    e.preventDefault()
    //Do ajax request, get back data, which is an array of campaigns
    var toShowValueIsChanging = this.state.searchString;
    $.get("/api/search?search="+ this.state.searchString, function(response){
      this.setState({campaigns: [{title: toShowValueIsChanging}]})
    }.bind(this))
    this.setState({campaigns: [{title: toShowValueIsChanging}]})
}
  render () {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input value={this.state.searchString} onChange={this.handleChange} />
            <button type="submit">Click me!</button>
        </form>
        { this.state.campaigns.map(function(campaign){
          return (<div><h1>{campaign.title} </h1></div>)
        }) }
      </div>
    );
  }
}

SearchApp.propTypes = {
  text: React.PropTypes.string
};
