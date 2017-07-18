import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/session_actions';

const defaultState = () => ({
  currentUser: null,
  errors: []
});

const SessionReducer = (state = defaultState(), action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, state, { currentUser: action.currentUser });

    case RECEIVE_ERRORS:
      return Object.assign({}, state, { errors: action.errors });

    case CLEAR_ERRORS:
      return Object.assign({}, state, { errors: [] } );

    default:
      return state;
  }
};

export default SessionReducer;
