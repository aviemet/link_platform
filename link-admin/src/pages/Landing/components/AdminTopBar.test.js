import React from 'react';
import AdminTopBar from './AdminTopBar';
import { shallow } from '../../../utils/testing/fela';

const DUMMY_TAGS = [
    <div id="1" key='1' class='data-test-tag'></div>,
    <div id="2" key='2' class='data-test-tag'></div>,
    <div id="3" key='3' class='data-test-tag'></div>
]

const setShallowWrapper = (props = {}) => shallow(
  <AdminTopBar
    tags={DUMMY_TAGS}
    {...props}
  />
)

describe('<AdminTopBar />', () => {
  it('renders a collection of tags', () => {
    const wrapper = setShallowWrapper()

    wrapper.find('div.data-test-tag').forEach((div, index) => {
      expect(div.prop('id')).toEqual(DUMMY_TAGS[index])
    })
  })
})
