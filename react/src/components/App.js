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
      <div className="group-members">
          <h4>Your Recommendation</h4>
          <RecommendationList
            recommendations={recommendations}
          />
          <br />
          <a href="/preferences/destroy" className="generic-buttons">Start Over</a>
      </div>
    );
  }
}

export default App;
