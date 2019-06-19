import '@zendeskgarden/react-buttons/dist/styles.css';
import '@zendeskgarden/react-tags/dist/styles.css';
import '@zendeskgarden/react-textfields/dist/styles.css';
import '@zendeskgarden/react-tabs/dist/styles.css';

import React from 'react';
import PropTypes from 'prop-types'
import { connect } from 'react-redux';
import actions from './actions'
import AdminTopBar from './components/AdminTopBar';
import * as Taxonomy from './components/Taxonomy';
import Location from '../../components/LocationDetails/index'
import OrganizationDetails from '../../components/OrganizationDetails/index'
import { Textarea, TextField, Label, Input } from '@zendeskgarden/react-textfields';
import { Grid, Row, Col } from '@zendeskgarden/react-grid';
import { Button } from '@zendeskgarden/react-buttons';

//Breadcrumbs
import '@zendeskgarden/react-breadcrumbs/dist/styles.css';
//import { ThemeProvider } from '@zendeskgarden/react-theming';
import { Breadcrumb, Item } from '@zendeskgarden/react-breadcrumbs';
import { Anchor } from '@zendeskgarden/react-buttons';



//Tabs tools
import { Tabs, TabPanel } from '@zendeskgarden/react-tabs';
import { ThemeProvider } from 'react-fela';

class Landing extends React.PureComponent {
  static propTypes = {
    activeTaxonomyFilters: PropTypes.array.isRequired,
    updateTaxonomyFilters: PropTypes.func.isRequired,
    taxonomies: PropTypes.array.isRequired
  };

  static defaultProps = {
    taxonomies: [],
  }

  render() {
    const { activeTaxonomyFilters, updateTaxonomyFilters, taxonomies } = this.props;

    return (
      <>

  /* This will probably need to be hardcoded by each page */
  <ThemeProvider>
    <Breadcrumb>
      <Anchor href="/">Root</Anchor>
      <Anchor href="..">Parent</Anchor>
      <Item>Self</Item>
    </Breadcrumb>
  </ThemeProvider>;


    <Tabs>
      <TabPanel label="Details" key="tab-1">
       Orgnaization Details
      <OrganizationDetails/>


      </TabPanel>
      <TabPanel label="Location" key="tab-2">
        Locations
        <Location/>
      </TabPanel>
    </Tabs>
    
          


      <AdminTopBar
        tags={taxonomies.map((taxonomy, index) => (
          <Taxonomy.Tag
            key={taxonomy.id}
            onClick={updateTaxonomyFilters}
            isActive={activeTaxonomyFilters.includes(taxonomy.id)}
            taxonomy={{index, ...taxonomy}}
          />
        ))}
      />

      </>
    );
  }
}

const mapStateToProps = state => {
  const landingState = state.landing;
  return { ...landingState };
};

const mapDispatchToProps = dispatch => ({
  updateTaxonomyFilters: tf => dispatch(actions.updateTaxonomyFilters(tf))
});

const withStateAndActions = connect(
  mapStateToProps,
  mapDispatchToProps
);

export default withStateAndActions(Landing);