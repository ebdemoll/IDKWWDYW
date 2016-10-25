import React from 'react';
import Recommendation from './Recommendation';

const RecommendationList = props => {
  let recommendations = props.recommendations.map(recommendation => {

    return (
      <Recommendation
        key={recommendation.id}
        id={recommendation.id}
        name={recommendation.name}
        address={recommendation.address}
        phone={recommendation.phone}
        rating={recommendation.yelp_rating}
      />
    );
  });

  return (
    <div>
      <ul>
        {recommendations}
      </ul>
    </div>
  );
};

export default RecommendationList;
