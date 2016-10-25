import React from 'react';

const Recommendation = props => {
  let name = props.name;
  let address = props.address;
  let phone = props.phone;
  let rating = props.rating;

  return (

      <div className="location-info">
        <h3>{name}</h3>
        <h4>{address}</h4>
        <h4>{phone}</h4>
        <h4>{rating}</h4>
      </div>
  );
};

export default Recommendation;
