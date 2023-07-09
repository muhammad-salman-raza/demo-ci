import { mount } from '@vue/test-utils';
import axios from 'axios';
import App from '../src/App.vue';

describe('App', () => {
  it('fetches data and renders message', async () => {
    const mockResponse = { data: { message: 'Hello World' } };
    jest.spyOn(axios, 'get').mockResolvedValue(mockResponse);

    const wrapper = mount(App);
    await wrapper.vm.$nextTick();

    expect(wrapper.find('p').text()).toBe('Hello World');
  });

  it('handles error and displays error message', async () => {
    const mockError = new Error('API Error');
    jest.spyOn(axios, 'get').mockRejectedValue(mockError);

    const wrapper = mount(App);
    await wrapper.vm.$nextTick();

    expect(wrapper.find('p').text()).toBe('Error fetching data: API Error');
  });
});
