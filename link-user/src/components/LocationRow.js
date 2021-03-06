import { h } from 'preact';
import { createComponent, createComponentWithProxy } from 'preact-fela';

// Local imports
import ServiceStatus from './ServiceStatus';
import Link from './Link';

// Styles
const LocationItem = createComponent(
	() => ({
		display: 'flex',
		flexDirection: 'column',
		borderBottom: '1px solid #DCDCDC',
		fontSize: 15
	}),
	'li'
);

const Spacer = createComponent(() => ({
	height: 8
}));

const LocationLink = createComponentWithProxy(
	() => ({
		textDecoration: 'none',
		color: '#000',
		padding: '14px'
	}),
	Link
);

const ContentContainer = createComponent(() => ({
	display: 'flex',
	width: '100%',
	flexDirection: 'row',
	flexWrap: 'nowrap',
	justifyContent: 'space-between'
}));

const DetailsContainer = createComponent(() => ({
	display: 'flex',
	width: 'calc(100% - 20px)',
	flexDirection: 'column',
	flexWrap: 'nowrap',
	justifyContent: 'space-between'
}));

const NameAndStatusContainer = createComponent(() => ({
	display: 'flex',
	flexDirection: 'row',
	flexWrap: 'nowrap',
	justifyContent: 'space-between',
	alignItems: 'flex-start'
}));

const NameText = createComponent(
	() => ({
		fontWeight: 'bold',
		whiteSpace: 'nowrap',
		overflow: 'hidden',
		textOverflow: 'ellipsis',
		flexBasis: '83%'
	}),
	'span'
);

const ServiceStatusText = createComponentWithProxy(
	() => ({
		flexBasis: '15%'
	}),
	ServiceStatus
);

const IconAndDistanceContainer = createComponent(() => ({
	display: 'flex',
	flexDirection: 'row',
	flexWrap: 'nowrap',
	alignItems: 'flex-end',
	justifyContent: 'space-between',
	color: 'rgb(153, 153, 153)'
}));

const SidebarContainer = createComponent(() => ({
	fontWeight: 'lighter',
	color: 'rgb(204, 204, 204)',
	width: '15px',
	textAlign: 'right'
}));

const DistanceText = props => <div>{props.text}</div>;

const IconSpans = props => (
	<div>
		{props.taxonomies.map((taxonomy, index) => {
			const iconClass = ''; // TODO: determine dynamic CSS class
			return (
				<span key={`category-${index}`}>
					<i className={`category-icon ${iconClass}`} />
				</span>
			);
		})}
	</div>
);

const LocationRow = props => (
	<LocationItem key={`location-${props.id}`}>
		<LocationLink
			href={`/locations/${props.id}`}
			to={`/locations/${props.id}`}
			title={`Click to see more details about ${props.name}`}
		>
			<ContentContainer>
				<DetailsContainer>
					<NameAndStatusContainer>
						<NameText>{props.name}</NameText>
						<ServiceStatusText services={props.services} />
					</NameAndStatusContainer>
					<Spacer />
					<IconAndDistanceContainer>
						{/* TODO: get relevant taxonomies in JS */}
						<IconSpans taxonomies={[]} />
						{props.duration && <DistanceText text={props.duration.text} />}
					</IconAndDistanceContainer>
				</DetailsContainer>
				<SidebarContainer>
					<i className={`icon-caret`} />
				</SidebarContainer>
			</ContentContainer>
		</LocationLink>
	</LocationItem>
);

export default LocationRow;
