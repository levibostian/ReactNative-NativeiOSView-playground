import PropTypes from 'prop-types';
import React from 'react';
import {requireNativeComponent} from 'react-native';

export class CoolView extends React.Component {
  render() {
    return <RNCoolView {...this.props} />;
  }
}

CoolView.propTypes = {
  /**
   * A Boolean value that determines whether the user may use pinch
   * gestures to zoom in and out of the map.
   */
  value: PropTypes.number,
  leftButtonText: PropTypes.string,
};

// requireNativeComponent automatically resolves 'RNTMap' to 'RNTMapManager'
const RNCoolView = requireNativeComponent('CoolView');
