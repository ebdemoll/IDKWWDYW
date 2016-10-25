import React, { Component } from 'react';
import RecommendationList from './RecommendationList'

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      recommendations: []
    };
    this.getRecommendations = this.getRecommendations.bind(this);
  }

  getRecommendations() {
    let app = this;
    $.ajax({
      method: 'GET',
      url: '/recommendations.json',
      contentType: 'application/json'
    })
    .done(data => {
      app.setState({ recommendations: data })
    });
  }

  componentDidMount() {
    console.log(this.state.recommendations);
    this.getRecommendations();
    setInterval(this.getRecommendations, 5000);
  }

  render() {
    let recommendations = this.state.recommendations;
    return (
      <div>
          <h1 className="show-header">Your Recommendation</h1>
          <RecommendationList
            recommendations={recommendations}
          />
          <a href="/preferences/destroy" className="back-link top-padded">Start Over</a>
      </div>
    );
  }
}

export default App;
