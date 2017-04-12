class SearchApp extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      searchString: "",
      campaigns: this.props.campaigns || []
    }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleChange(e) {
    this.setState({searchString: e.target.value})
  }

  handleSubmit(e) {
    e.preventDefault()
    $.get("/api/search?search="+ this.state.searchString, function(response){
      this.setState({campaigns: response})
    }.bind(this))
}

  render () {
    return (
      <div>
        <form className="center" onSubmit={this.handleSubmit}>
          <input value={this.state.searchString} placeholder="Enter search here" onChange={this.handleChange} />
            <button type="submit" className="btn btn-success center">Search!</button>
        </form>
        { this.state.campaigns.map(function(campaign){
          return (<div>
            <h1 className="center varela fade-in">{ campaign.title }</h1>
            <center><img className="image-ctr border fade-in" src={ `${campaign.small_image_url}` } /></center>
            <h3 className="center varela fade-in">{ campaign.tagline }</h3>
            <h3 className="center varela fade-in"> <a href={ `${campaign.web_url}` }>{ campaign.title }</a>  </h3>
          </div>)
        }) }
      </div>
    );
  }
}
