import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/network/internet_provider.dart';
import '../bloc/recipe_list_bloc.dart';
import '../widgets/filter_panel_widget.dart';
import '../widgets/recipe_card_widget.dart';
import '../widgets/search_field_widget.dart';

class RecipeListWidget extends StatefulWidget {
  const RecipeListWidget({super.key});

  @override
  State<RecipeListWidget> createState() => _RecipeListWidgetState();
}

class _RecipeListWidgetState extends State<RecipeListWidget> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _timeFilterController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<RecipeListBloc>().add(LoadInitialRecipesEvent());

    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);

    final internetProvider = Provider.of<InternetProvider>(
      context,
      listen: false,
    );
    internetProvider.addListener(_onInternetChanged);
  }

  void _onSearchChanged() {
    context.read<RecipeListBloc>().add(
      ApplyFiltersEvent(
        searchQuery: _searchController.text,
        withImageOnly: false,
        maxPrepTime: null,
        isTimeFilterApplied: false,
      ),
    );
  }

  void _onScroll() {
    if (state is! RecipeListLoaded) return;
    final currentState = state as RecipeListLoaded;

    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        currentState.hasMore &&
        !currentState.isLoadingMore) {
      context.read<RecipeListBloc>().add(LoadMoreRecipesEvent());
    }
  }

  void _onInternetChanged() {
    if (Provider.of<InternetProvider>(context, listen: false).isOnline) {
      _refresh();
    }
  }

  void _refresh() {
    _searchController.clear();
    _timeFilterController.clear();

    context.read<RecipeListBloc>().add(
      ApplyFiltersEvent(
        searchQuery: '',
        withImageOnly: false,
        maxPrepTime: null,
        isTimeFilterApplied: false,
      ),
    );

    context.read<RecipeListBloc>().add(RefreshRecipesEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _timeFilterController.dispose();
    _scrollController.dispose();
    Provider.of<InternetProvider>(
      context,
      listen: false,
    ).removeListener(_onInternetChanged);
    super.dispose();
  }

  RecipeListState get state => context.read<RecipeListBloc>().state;

  Widget _buildLoadingIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeListBloc, RecipeListState>(
      listener: (context, state) {
        if (state is RecipeListLoaded &&
            state.filteredRecipes.length < 10 &&
            state.hasMore &&
            !state.isLoadingMore &&
            state.filteredRecipes.isNotEmpty) {
          context.read<RecipeListBloc>().add(LoadMoreRecipesEvent());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async => _refresh(),
            child: _buildContent(context, state),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, RecipeListState state) {
    if (state is RecipeListInitial || state is RecipeListLoading) {
      return _buildLoadingIndicator(context);
    }

    if (state is RecipeListError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _refresh,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Повторить'),
            ),
          ],
        ),
      );
    }

    if (state is RecipeListLoaded) {
      return Column(
        children: [
          SearchFieldWidget(
            state: state,
            controller: _searchController,
            onClear: _refresh,
            onToggleFilters: (show) => context.read<RecipeListBloc>().add(
              ToggleFiltersVisibilityEvent(show),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: state.showFilters
                ? FilterPanelWidget(
                    state: state,
                    onReset: _refresh,
                    onApply: (params) => context.read<RecipeListBloc>().add(
                      ApplyFiltersEvent(
                        searchQuery: state.searchQuery,
                        withImageOnly: params.withImage,
                        maxPrepTime: params.maxTime,
                        isTimeFilterApplied: params.maxTime != null,
                      ),
                    ),
                    timeController: _timeFilterController,
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
            child: state.filteredRecipes.isEmpty
                ? _buildEmptyState(context, state)
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: state.filteredRecipes.length,
                    itemBuilder: (context, index) =>
                        RecipeCardWidget(recipe: state.filteredRecipes[index]),
                  ),
          ),
          if (state.isLoadingMore && state.filteredRecipes.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildLoadingIndicator(context),
            ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildEmptyState(BuildContext context, RecipeListLoaded state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Продолжаем искать...',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildLoadingIndicator(context),
          ),
        ],
      ),
    );
  }
}
