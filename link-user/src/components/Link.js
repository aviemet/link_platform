import  PropTypes from 'prop-types';
import { Component } from 'preact/compat';
import { omit } from 'ramda';

import {
	redirectTo,
	redirectToViaReplace,
	convertToQueryString
} from '../lib/navigation';

// import history from '../core/history';
// TODO: History
const history = {
	createHref: () => {
		console.log('implement history createRef');
	}
};

class Link extends Component {
	handleClick = event => {
		if (this.props.onClick) {
			this.props.onClick(event);
		}

		// Return early if this is *not* a left-click.
		if (event.button !== 0) {
			return;
		}

		if (event.metaKey || event.altKey || event.ctrlKey || event.shiftKey) {
			return;
		}

		if (event.defaultPrevented === true) {
			return;
		}

		event.preventDefault();

		const queryString =
			this.props.queryString || convertToQueryString(this.props.query);
		const go = this.props.replaceState ? redirectToViaReplace : redirectTo;

		if (this.props.to && (this.props.query || this.props.queryString)) {
			go({
				pathname: this.props.to,
				search: queryString
			});
		}
		else if (this.props.to) {
			go(this.props.to);
		}
	}
	static propTypes = {
		to: PropTypes.oneOfType([PropTypes.string, PropTypes.object]).isRequired,
		onClick: PropTypes.func
	}

	render() {
		const propsForChild = omit(['replaceState'], this.props);
		const { to, ...props } = propsForChild; // eslint-disable-line no-use-before-define
		return (
			<a href={history.createHref(to)} {...props} onClick={this.handleClick} />
		);
	}
}

export default Link;
